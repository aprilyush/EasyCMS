﻿using System;
using System.Diagnostics;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Security.Cryptography;
using System.Text;
using System.Threading;

namespace Atlass.Framework.Common {
    /// <summary>
    /// Id生成器，代码出自：https://github.com/tangxuehua/ecommon/blob/master/src/ECommon/Utilities/ObjectId.cs
    /// </summary>
    internal struct MongoObjectId : IComparable<MongoObjectId>, IEquatable<MongoObjectId>{
        // private static fields
        private static readonly DateTime __unixEpoch;
        private static readonly long __dateTimeMaxValueMillisecondsSinceEpoch;
        private static readonly long __dateTimeMinValueMillisecondsSinceEpoch;
        private static MongoObjectId __emptyInstance = default( MongoObjectId );
        private static int __staticMachine;
        private static short __staticPid;
        private static int __staticIncrement; // high byte will be masked out when generating new ObjectId
        private static uint[] _lookup32 = Enumerable.Range( 0, 256 ).Select( i => {
            string s = i.ToString( "x2" );
            return ( (uint)s[0] ) + ( (uint)s[1] << 16 );
        } ).ToArray();

        // we're using 14 bytes instead of 12 to hold the ObjectId in memory but unlike a byte[] there is no additional object on the heap
        // the extra two bytes are not visible to anyone outside of this class and they buy us considerable simplification
        // an additional advantage of this representation is that it will serialize to JSON without any 64 bit overflow problems
        private int _timestamp;
        private int _machine;
        private short _pid;
        private int _increment;

        // static constructor
        static MongoObjectId() {
            __unixEpoch = new DateTime( 1970, 1, 1, 0, 0, 0, DateTimeKind.Utc );
            __dateTimeMaxValueMillisecondsSinceEpoch = ( DateTime.MaxValue - __unixEpoch ).Ticks / 10000;
            __dateTimeMinValueMillisecondsSinceEpoch = ( DateTime.MinValue - __unixEpoch ).Ticks / 10000;
            __staticMachine = GetMachineHash();
            __staticIncrement = ( new System.Random() ).Next();
            __staticPid = (short)GetCurrentProcessId();
        }

        // constructors
        /// <summary>
        /// Initializes a new instance of the ObjectId class.
        /// </summary>
        /// <param name="bytes">The bytes.</param>
        public MongoObjectId( byte[] bytes ) {
            if( bytes == null ) {
                throw new ArgumentNullException( "bytes" );
            }
            Unpack( bytes, out _timestamp, out _machine, out _pid, out _increment );
        }

        /// <summary>
        /// Initializes a new instance of the ObjectId class.
        /// </summary>
        /// <param name="timestamp">The timestamp (expressed as a DateTime).</param>
        /// <param name="machine">The machine hash.</param>
        /// <param name="pid">The PID.</param>
        /// <param name="increment">The increment.</param>
        public MongoObjectId( DateTime timestamp, int machine, short pid, int increment )
            : this( GetTimestampFromDateTime( timestamp ), machine, pid, increment ) {
        }

        /// <summary>
        /// Initializes a new instance of the ObjectId class.
        /// </summary>
        /// <param name="timestamp">The timestamp.</param>
        /// <param name="machine">The machine hash.</param>
        /// <param name="pid">The PID.</param>
        /// <param name="increment">The increment.</param>
        public MongoObjectId( int timestamp, int machine, short pid, int increment ) {
            if( ( machine & 0xff000000 ) != 0 ) {
                throw new ArgumentOutOfRangeException( "machine", "The machine value must be between 0 and 16777215 (it must fit in 3 bytes)." );
            }
            if( ( increment & 0xff000000 ) != 0 ) {
                throw new ArgumentOutOfRangeException( "increment", "The increment value must be between 0 and 16777215 (it must fit in 3 bytes)." );
            }

            _timestamp = timestamp;
            _machine = machine;
            _pid = pid;
            _increment = increment;
        }

        /// <summary>
        /// Initializes a new instance of the ObjectId class.
        /// </summary>
        /// <param name="value">The value.</param>
        public MongoObjectId( string value ) {
            if( value == null ) {
                throw new ArgumentNullException( "value" );
            }
            Unpack( ParseHexString( value ), out _timestamp, out _machine, out _pid, out _increment );
        }

        // public static properties
        /// <summary>
        /// Gets an instance of ObjectId where the value is empty.
        /// </summary>
        public static MongoObjectId Empty {
            get { return __emptyInstance; }
        }

        // public properties
        /// <summary>
        /// Gets the timestamp.
        /// </summary>
        public int Timestamp {
            get { return _timestamp; }
        }

        /// <summary>
        /// Gets the machine.
        /// </summary>
        public int Machine {
            get { return _machine; }
        }

        /// <summary>
        /// Gets the PID.
        /// </summary>
        public short Pid {
            get { return _pid; }
        }

        /// <summary>
        /// Gets the increment.
        /// </summary>
        public int Increment {
            get { return _increment; }
        }

        /// <summary>
        /// Gets the creation time (derived from the timestamp).
        /// </summary>
        public DateTime CreationTime {
            get { return __unixEpoch.AddSeconds( _timestamp ); }
        }

        // public operators
        /// <summary>
        /// Compares two ObjectIds.
        /// </summary>
        /// <param name="lhs">The first ObjectId.</param>
        /// <param name="rhs">The other ObjectId</param>
        /// <returns>True if the first ObjectId is less than the second ObjectId.</returns>
        public static bool operator <( MongoObjectId lhs, MongoObjectId rhs ) {
            return lhs.CompareTo( rhs ) < 0;
        }

        /// <summary>
        /// Compares two ObjectIds.
        /// </summary>
        /// <param name="lhs">The first ObjectId.</param>
        /// <param name="rhs">The other ObjectId</param>
        /// <returns>True if the first ObjectId is less than or equal to the second ObjectId.</returns>
        public static bool operator <=( MongoObjectId lhs, MongoObjectId rhs ) {
            return lhs.CompareTo( rhs ) <= 0;
        }

        /// <summary>
        /// Compares two ObjectIds.
        /// </summary>
        /// <param name="lhs">The first ObjectId.</param>
        /// <param name="rhs">The other ObjectId.</param>
        /// <returns>True if the two ObjectIds are equal.</returns>
        public static bool operator ==( MongoObjectId lhs, MongoObjectId rhs ) {
            return lhs.Equals( rhs );
        }

        /// <summary>
        /// Compares two ObjectIds.
        /// </summary>
        /// <param name="lhs">The first ObjectId.</param>
        /// <param name="rhs">The other ObjectId.</param>
        /// <returns>True if the two ObjectIds are not equal.</returns>
        public static bool operator !=( MongoObjectId lhs, MongoObjectId rhs ) {
            return !( lhs == rhs );
        }

        /// <summary>
        /// Compares two ObjectIds.
        /// </summary>
        /// <param name="lhs">The first ObjectId.</param>
        /// <param name="rhs">The other ObjectId</param>
        /// <returns>True if the first ObjectId is greather than or equal to the second ObjectId.</returns>
        public static bool operator >=( MongoObjectId lhs, MongoObjectId rhs ) {
            return lhs.CompareTo( rhs ) >= 0;
        }

        /// <summary>
        /// Compares two ObjectIds.
        /// </summary>
        /// <param name="lhs">The first ObjectId.</param>
        /// <param name="rhs">The other ObjectId</param>
        /// <returns>True if the first ObjectId is greather than the second ObjectId.</returns>
        public static bool operator >( MongoObjectId lhs, MongoObjectId rhs ) {
            return lhs.CompareTo( rhs ) > 0;
        }

        // public static methods
        /// <summary>
        /// Generates a new ObjectId with a unique value.
        /// </summary>
        /// <returns>An ObjectId.</returns>
        public static MongoObjectId GenerateNewId() {
            return GenerateNewId( GetTimestampFromDateTime( DateTime.UtcNow ) );
        }

        /// <summary>
        /// Generates a new ObjectId with a unique value (with the timestamp component based on a given DateTime).
        /// </summary>
        /// <param name="timestamp">The timestamp component (expressed as a DateTime).</param>
        /// <returns>An ObjectId.</returns>
        public static MongoObjectId GenerateNewId( DateTime timestamp ) {
            return GenerateNewId( GetTimestampFromDateTime( timestamp ) );
        }

        /// <summary>
        /// Generates a new ObjectId with a unique value (with the given timestamp).
        /// </summary>
        /// <param name="timestamp">The timestamp component.</param>
        /// <returns>An ObjectId.</returns>
        public static MongoObjectId GenerateNewId( int timestamp ) {
            int increment = Interlocked.Increment( ref __staticIncrement ) & 0x00ffffff; // only use low order 3 bytes
            return new MongoObjectId( timestamp, __staticMachine, __staticPid, increment );
        }

        /// <summary>
        /// Generates a new ObjectId string with a unique value.
        /// </summary>
        /// <returns>The string value of the new generated ObjectId.</returns>
        public static string GenerateNewStringId() {
            return GenerateNewId().ToString();
        }

        /// <summary>
        /// Packs the components of an ObjectId into a byte array.
        /// </summary>
        /// <param name="timestamp">The timestamp.</param>
        /// <param name="machine">The machine hash.</param>
        /// <param name="pid">The PID.</param>
        /// <param name="increment">The increment.</param>
        /// <returns>A byte array.</returns>
        public static byte[] Pack( int timestamp, int machine, short pid, int increment ) {
            if( ( machine & 0xff000000 ) != 0 ) {
                throw new ArgumentOutOfRangeException( "machine", "The machine value must be between 0 and 16777215 (it must fit in 3 bytes)." );
            }
            if( ( increment & 0xff000000 ) != 0 ) {
                throw new ArgumentOutOfRangeException( "increment", "The increment value must be between 0 and 16777215 (it must fit in 3 bytes)." );
            }

            byte[] bytes = new byte[12];
            bytes[0] = (byte)( timestamp >> 24 );
            bytes[1] = (byte)( timestamp >> 16 );
            bytes[2] = (byte)( timestamp >> 8 );
            bytes[3] = (byte)( timestamp );
            bytes[4] = (byte)( machine >> 16 );
            bytes[5] = (byte)( machine >> 8 );
            bytes[6] = (byte)( machine );
            bytes[7] = (byte)( pid >> 8 );
            bytes[8] = (byte)( pid );
            bytes[9] = (byte)( increment >> 16 );
            bytes[10] = (byte)( increment >> 8 );
            bytes[11] = (byte)( increment );
            return bytes;
        }

        /// <summary>
        /// Parses a string and creates a new ObjectId.
        /// </summary>
        /// <param name="s">The string value.</param>
        /// <returns>A ObjectId.</returns>
        public static MongoObjectId Parse( string s ) {
            if( s == null ) {
                throw new ArgumentNullException( "s" );
            }
            if( s.Length != 24 ) {
                throw new ArgumentOutOfRangeException( "s", "ObjectId string value must be 24 characters." );
            }
            return new MongoObjectId( ParseHexString( s ) );
        }

        /// <summary>
        /// Unpacks a byte array into the components of an ObjectId.
        /// </summary>
        /// <param name="bytes">A byte array.</param>
        /// <param name="timestamp">The timestamp.</param>
        /// <param name="machine">The machine hash.</param>
        /// <param name="pid">The PID.</param>
        /// <param name="increment">The increment.</param>
        public static void Unpack( byte[] bytes, out int timestamp, out int machine, out short pid, out int increment ) {
            if( bytes == null ) {
                throw new ArgumentNullException( "bytes" );
            }
            if( bytes.Length != 12 ) {
                throw new ArgumentOutOfRangeException( "bytes", "Byte array must be 12 bytes long." );
            }
            timestamp = ( bytes[0] << 24 ) + ( bytes[1] << 16 ) + ( bytes[2] << 8 ) + bytes[3];
            machine = ( bytes[4] << 16 ) + ( bytes[5] << 8 ) + bytes[6];
            pid = (short)( ( bytes[7] << 8 ) + bytes[8] );
            increment = ( bytes[9] << 16 ) + ( bytes[10] << 8 ) + bytes[11];
        }

        // private static methods
        /// <summary>
        /// Gets the current process id.  This method exists because of how CAS operates on the call stack, checking
        /// for permissions before executing the method.  Hence, if we inlined this call, the calling method would not execute
        /// before throwing an exception requiring the try/catch at an even higher level that we don't necessarily control.
        /// </summary>
        [MethodImpl( MethodImplOptions.NoInlining )]
        private static int GetCurrentProcessId() {
            return Process.GetCurrentProcess().Id;
        }

        private static int GetMachineHash() {
            var hostName = Environment.MachineName; // use instead of Dns.HostName so it will work offline
            var md5 = MD5.Create();
            var hash = md5.ComputeHash( Encoding.UTF8.GetBytes( hostName ) );
            return ( hash[0] << 16 ) + ( hash[1] << 8 ) + hash[2]; // use first 3 bytes of hash
        }

        private static int GetTimestampFromDateTime( DateTime timestamp ) {
            return (int)Math.Floor( ( ToUniversalTime( timestamp ) - __unixEpoch ).TotalSeconds );
        }

        // public methods
        /// <summary>
        /// Compares this ObjectId to another ObjectId.
        /// </summary>
        /// <param name="other">The other ObjectId.</param>
        /// <returns>A 32-bit signed integer that indicates whether this ObjectId is less than, equal to, or greather than the other.</returns>
        public int CompareTo( MongoObjectId other ) {
            int r = _timestamp.CompareTo( other._timestamp );
            if( r != 0 ) { return r; }
            r = _machine.CompareTo( other._machine );
            if( r != 0 ) { return r; }
            r = _pid.CompareTo( other._pid );
            if( r != 0 ) { return r; }
            return _increment.CompareTo( other._increment );
        }

        /// <summary>
        /// Compares this ObjectId to another ObjectId.
        /// </summary>
        /// <param name="rhs">The other ObjectId.</param>
        /// <returns>True if the two ObjectIds are equal.</returns>
        public bool Equals( MongoObjectId rhs ) {
            return
                _timestamp == rhs._timestamp &&
                _machine == rhs._machine &&
                _pid == rhs._pid &&
                _increment == rhs._increment;
        }

        /// <summary>
        /// Compares this ObjectId to another object.
        /// </summary>
        /// <param name="obj">The other object.</param>
        /// <returns>True if the other object is an ObjectId and equal to this one.</returns>
        public override bool Equals( object obj ) {
            if( obj is MongoObjectId ) {
                return Equals( (MongoObjectId)obj );
            }
            else {
                return false;
            }
        }

        /// <summary>
        /// Gets the hash code.
        /// </summary>
        /// <returns>The hash code.</returns>
        public override int GetHashCode() {
            int hash = 17;
            hash = 37 * hash + _timestamp.GetHashCode();
            hash = 37 * hash + _machine.GetHashCode();
            hash = 37 * hash + _pid.GetHashCode();
            hash = 37 * hash + _increment.GetHashCode();
            return hash;
        }

        /// <summary>
        /// Converts the ObjectId to a byte array.
        /// </summary>
        /// <returns>A byte array.</returns>
        public byte[] ToByteArray() {
            return Pack( _timestamp, _machine, _pid, _increment );
        }

        /// <summary>
        /// Returns a string representation of the value.
        /// </summary>
        /// <returns>A string representation of the value.</returns>
        public override string ToString() {
            return ToHexString( ToByteArray() );
        }

        /// <summary>
        /// Parses a hex string into its equivalent byte array.
        /// </summary>
        /// <param name="s">The hex string to parse.</param>
        /// <returns>The byte equivalent of the hex string.</returns>
        public static byte[] ParseHexString( string s ) {
            if( s == null ) {
                throw new ArgumentNullException( "s" );
            }

            if( s.Length % 2 == 1 ) {
                throw new Exception( "The binary key cannot have an odd number of digits" );
            }

            byte[] arr = new byte[s.Length >> 1];

            for( int i = 0; i < s.Length >> 1; ++i ) {
                arr[i] = (byte)( ( GetHexVal( s[i << 1] ) << 4 ) + ( GetHexVal( s[( i << 1 ) + 1] ) ) );
            }

            return arr;
        }
        /// <summary>
        /// Converts a byte array to a hex string.
        /// </summary>
        /// <param name="bytes">The byte array.</param>
        /// <returns>A hex string.</returns>
        public static string ToHexString( byte[] bytes ) {
            if( bytes == null ) {
                throw new ArgumentNullException( "bytes" );
            }
            var result = new char[bytes.Length * 2];
            for( int i = 0; i < bytes.Length; i++ ) {
                var val = _lookup32[bytes[i]];
                result[2 * i] = (char)val;
                result[2 * i + 1] = (char)( val >> 16 );
            }
            return new string( result );
        }
        /// <summary>
        /// Converts a DateTime to number of milliseconds since Unix epoch.
        /// </summary>
        /// <param name="dateTime">A DateTime.</param>
        /// <returns>Number of seconds since Unix epoch.</returns>
        public static long ToMillisecondsSinceEpoch( DateTime dateTime ) {
            var utcDateTime = ToUniversalTime( dateTime );
            return ( utcDateTime - __unixEpoch ).Ticks / 10000;
        }
        /// <summary>
        /// Converts a DateTime to UTC (with special handling for MinValue and MaxValue).
        /// </summary>
        /// <param name="dateTime">A DateTime.</param>
        /// <returns>The DateTime in UTC.</returns>
        public static DateTime ToUniversalTime( DateTime dateTime ) {
            if( dateTime == DateTime.MinValue ) {
                return DateTime.SpecifyKind( DateTime.MinValue, DateTimeKind.Utc );
            }
            else if( dateTime == DateTime.MaxValue ) {
                return DateTime.SpecifyKind( DateTime.MaxValue, DateTimeKind.Utc );
            }
            else {
                return dateTime.ToUniversalTime();
            }
        }

        private static int GetHexVal( char hex ) {
            int val = (int)hex;
            //For uppercase A-F letters:
            //return val - (val < 58 ? 48 : 55);
            //For lowercase a-f letters:
            //return val - (val < 58 ? 48 : 87);
            //Or the two combined, but a bit slower:
            return val - ( val < 58 ? 48 : ( val < 97 ? 55 : 87 ) );
        }
    }
}
