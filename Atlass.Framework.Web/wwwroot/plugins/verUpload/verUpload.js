window.verUpload = (function () {
    var FILES,
        EXT,
        NAME,
        size,
        method = "api/upload.php",
        lists,
        files,
        images,
        format = new FormData();
    var input_file;
    var uploads = function (param) {
        if (param.files) {
            files = document.querySelector(param.files)
        } else {
            //console.log("请选择上传控件");
            return false;
        }
        props;
        var links = document.createElement("link");
        links.href = getPath + "asset/upload.css?v=1.0.0";
        links.type = "text/css";
        links.rel = "stylesheet";
        links.id = "ver-upload";
        document.getElementsByTagName("head")[0].appendChild(links);
        NAME = param.name ? param.name : files.name;
        
        if (input_file = files.parentElement.querySelector("input[name='" + NAME + "']")) {
            files.parentElement.removeChild(input_file);
        }
        input_file = document.createElement("input");
        success = param.success ? param.success : success;
        fail = param.fail ? param.fail : fail;
        method = param.method ? param.method : "api/upload.php";
        if (param.load_list) lists = true;
        files.setAttribute("data-upload-btn", true);
        files.setAttribute("data-upload-method", method);
        //是否直接上传到服务器，默认为true
        files.setAttribute("data-upload-send", param.uploads ? false : true);
        files.setAttribute("data-upload-inputs", param.inputs ? param.inputs : "");
        var toarray = param.ext ? param.ext : [];
        if (param.size) {
            files.setAttribute("data-upload-size", param.size);
        }
        files.setAttribute("data-upload-ext", JSON.stringify(toarray));
        input_file.type = "file";
        input_file.name = NAME;
        input_file.style.display = "none";
        input_file.onchange = upload_files;
        files.parentElement.appendChild(input_file);
        files.onclick = function () {
            var fi = this.parentElement.querySelector("input[type='file']");
            fi.click();
        }
    };
    var upload_files = function () {
        var btn = this.parentElement.querySelector("[data-upload-btn]");
        var more = btn.getAttribute("data-upload-more");
        method = btn.getAttribute("data-upload-method");
        if (this.files) {
            FILES = this.files[0];
        } else {
            this.style.display = "inline-block";
            return fail("The current browser version is too low to support uploading plug-ins！");
        }

        if (!FILES) return false;
        size = btn.getAttribute("data-upload-size");
        if (size) size = parseInt(size);
        if (size > 0) {
            var s = FILES.size / 1024;
            if (s > size) {
                return fail("Upload files over the size limit【" + size + "KB】");
            }
        }
        var toarray = btn.getAttribute("data-upload-ext");
        toarray = JSON.parse(toarray);
        if (toarray.length) {
            toarray = toarray.join("|");
            EXT = new RegExp("(" + toarray + "$)", "i");
        }
        if (EXT) {
            var ext = FILES.name.split(".");
            ext = ext[ext.length - 1];
            if (!EXT.test(ext)) {
                return fail("Unsupported file format【" + ext + "】");
            }
        }
        var rs = /^(image)/;
        var upload_send = btn.getAttribute("data-upload-send");
        //不上传到服务端
        if (upload_send == "false") {
            var inputs = btn.getAttribute("data-upload-inputs");
            if (!inputs) {
                return fail("Missing essential parameters！");
            }
            inputs = this.parentElement.querySelector(inputs);
            if (rs.test(FILES.type)) {
                images = this.parentElement.querySelector("img");
                if (!images) {
                    images = document.createElement("img");
                    images.width = 120;
                    
                    this.parentElement.appendChild(images);
                }
            }
            var reader = new FileReader();
            reader.onload = function (e) {
                if (images) {
                    images.src = e.target.result;
                }
                inputs.value = e.target.result;
            };
            reader.readAsDataURL(FILES);
            return success("Uploaded successfully");
        }

        //if (rs.test(FILES.type) && !more) {
        //    images = this.parentElement.querySelector("img");
        //    if (!images) {
        //        images = document.createElement("img");
        //        images.width = 120;
        //        this.parentElement.appendChild(images);
        //    }
        //    var reader = new FileReader();
        //    reader.onload = function (e) {
        //        images.src = e.target.result;
        //    };
        //    reader.readAsDataURL(FILES);
        //}
        NAME = this.name;
        var uploadFileprocess_active, uploadFileLodaingText, uploadFileprocess_static;
        if (lists || more) {
            // this.parentElement.classList.add("upload")
            var pares = this.parentElement.querySelector(".uploadFilesBox");
            if (!pares) {
                pares = document.createElement("div");
                pares.className = "uploadFilesBox";
                this.parentElement.appendChild(pares);
            }
            //查看是否有列表
            var ul = pares.querySelector(".uploadFileList");
            if (!ul) {
                ul = document.createElement("ul");
                ul.className = "uploadFileList";
                pares.appendChild(ul);
            }
            var li = document.createElement("li");
            li.className = "uploadFileListItems";
            if (!more || (more && !this.parentElement.querySelector(".uploadFilewrapper"))) {
                var div1 = document.createElement("div");
                div1.className = "uploadFilewrapper uploadFilemyPromption-wrapper";
                var uploadFilemainContain = document.createElement("div");
                uploadFilemainContain.className = "uploadFilemainContain";
                var uploadFilereturnCommission = document.createElement("div");
                uploadFilereturnCommission.className = "uploadFilereturnCommission";
                var uploadFileprocess = document.createElement("div");
                uploadFileprocess.className = "uploadFileprocess";
                var uploadFileicon_flag = document.createElement("i");
                uploadFileicon_flag.className = "uploadFileicon-flag";
                var uploadFileprocess_static = document.createElement("div");
                uploadFileprocess_static.className = "uploadFileprocess-static";
                var uploadFileprocess_active = document.createElement("div");
                uploadFileprocess_active.className = "uploadFileprocess-active";
                var uploadFileLodaingText = document.createElement("div");
                uploadFileLodaingText.className = "uploadFileLodaingText";
                uploadFileprocess.appendChild(uploadFileicon_flag);
                uploadFileprocess.appendChild(uploadFileprocess_static);
                uploadFileprocess.appendChild(uploadFileprocess_active);
                uploadFileprocess.appendChild(uploadFileLodaingText);
                uploadFilereturnCommission.appendChild(uploadFileprocess);
                uploadFilemainContain.appendChild(uploadFilereturnCommission);
                div1.appendChild(uploadFilemainContain);
                if (!more) {
                    li.appendChild(div1);
                } else {
                    uploadFileLodaingText.innerText = "Document in preparation...";
                    ul.classList.add("uploadFileMoreLoadsList")
                    div1.classList.add("uploadFileMoreLoads");
                    pares.appendChild(div1);
                }
            }
            var div2 = document.createElement("div");
            div2.className = "uploadFileListItemsContents";
            var uploadFileListItemsName = document.createElement("span");
            uploadFileListItemsName.className = "uploadFileListItemsName";
            uploadFileListItemsName.innerText = FILES.name;
            div2.appendChild(uploadFileListItemsName);
            var uploadFileListItemsSizes = document.createElement("span");
            uploadFileListItemsSizes.className = "uploadFileListItemsSizes";
            var ss = (Math.floor((FILES.size * 100 / 1024)) / 100);
            var tt = "kb";
            if (ss > 1024) {
                ss = (Math.floor((FILES.size * 100 / 1024 / 1024)) / 100);
                tt = "Mb";
            }
            uploadFileListItemsSizes.innerText = ss + tt;
            div2.appendChild(uploadFileListItemsSizes);
            if (more) {
                var len = ul.querySelectorAll("li").length;
                var names = this.name + "[" + len + "]";
                format.append(names, FILES);
                var span_close = document.createElement("a");
                span_close.className = "uploadFileClose";
                span_close.href = "javascript:;";
                span_close.innerText = "Cancel";
                span_close.onclick = close_uploads;
                span_close.setAttribute("data-del-names", names);
                span_close.setAttribute("data-file-names", FILES.name);
                div2.appendChild(span_close);
                if (!pares.querySelector(".uploadFileMoreBtn")) {
                    var buttons = document.createElement("div");
                    buttons.className = "uploadFileMoreBtn";
                    var btns = document.createElement("a");
                    btns.href = "javascript:;";
                    btns.className = "uploadFileOk";
                    btns.text = "Upload";
                    btns.onclick = move_saves;
                    buttons.appendChild(btns);
                    pares.appendChild(buttons);
                }
            }
            li.appendChild(div2);
            ul.appendChild(li);
        }
        if (!more) {
            saves(this, uploadFileprocess_active, uploadFileLodaingText, uploadFileprocess_static);
        }
    };

    var close_uploads = function () {
        var deletes = this.getAttribute("data-del-name");
        format.delete(deletes);
        var parent = this.parentElement.parentElement;
        parent.parentElement.removeChild(parent);
    };

    var move_saves = function () {
        var as = this.parentElement.parentElement.querySelectorAll(".uploadFileClose");
        if (as.length < 1) {
            return fail("No file uploaded！");
        }
        var items_children = {
            statics: this.parentElement.parentElement.querySelector(".uploadFileprocess-static"),
            actives: this.parentElement.parentElement.querySelector(".uploadFileprocess-active"),
            text: this.parentElement.parentElement.querySelector(".uploadFileLodaingText")
        };
        var flag = 0;
        [].forEach.call(as, function (as_items) {
            as_items.style.display = "none";
            var name = as_items.getAttribute("data-del-names");
            if (!format.get(name)) {
                flag++;
            }
        });
        if (flag == as.length) {
            return fail("Duplicate file uploads！");
        }
        items_children.statics.classList.remove("uploadFileError");
        items_children.statics.classList.remove("uploadFileSuccess");
        items_children.actives.classList.remove("uploadFileError");
        items_children.actives.classList.remove("uploadFileSuccess");
        format.append("name", NAME);
        var xhr = new XMLHttpRequest();
        xhr.open("POST", method, true);
        xhr.upload.onprogress = function (evt) {
            var pro = Math.floor((evt.loaded / evt.total * 100));
            var width = pro + "%";
            if (pro < 50) {
                width = ((5 - pro % 5) + pro) + "%";
            } else if (pro >= 50 && pro < 90) {
                width = ((2 - pro % 2) + pro) + "%";
            }
            items_children.actives.style.width = width;
            if (pro < 100) {
                items_children.text.innerText = "uploaded：" + width;
            } else {
                items_children.text.innerText = "File processing...";
            }
        };
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4) {
                format.delete("name");
                if (xhr.status == 200 || xhr.status == 304) {
                    items_children.text.innerText = "Uploaded successfully";
                    items_children.actives.classList.remove("uploadFileError");
                    items_children.actives.classList.add("uploadFileSuccess");
                    items_children.statics.classList.remove("uploadFileError");
                    items_children.statics.classList.add("uploadFileSuccess");
                    if (typeof xhr.responseText != "object") var d = JSON.parse(xhr.responseText);
                    [].forEach.call(as, function (item) {
                        var name = item.getAttribute("data-del-names");
                        var datas = item.getAttribute("data-file-names");
                        if (d.data && d.data.indexOf(datas) >= 0) {
                            item.style.display = "inline-block";
                            item.innerText = "Upload failed";
                        } else {
                            format.delete(name);
                            var span = document.createElement("b");
                            span.className = "uploadFileOk";
                            span.innerText = "Uploaded successfully";
                            item.parentElement.appendChild(span);
                        }
                    });
                    success(d);
                } else {
                    items_children.text.innerText = "Upload failed";
                    items_children.actives.classList.add("uploadFileError");
                    items_children.actives.classList.remove("uploadFileSuccess");
                    items_children.statics.classList.add("uploadFileError");
                    items_children.statics.classList.remove("uploadFileSuccess");
                    [].forEach.call(as, function (item) {
                        item.style.display = "inline-block";
                        item.innerText = "Upload failed";
                    });
                    fail(xhr.responseText);
                }
            }
        };
        xhr.send(format);
    };

    var saves = function (obj, uploadFileprocess_active, uploadFileLodaingText, uploadFileprocess_static) {
        var data = new FormData();
        data.append(NAME, FILES);
        data.append("name", NAME);
        var xhr = new XMLHttpRequest();
        xhr.open("POST", method, true);
        xhr.upload.onprogress = function (evt) {
            var pro = Math.floor((evt.loaded / evt.total * 100));
            var width = pro + "%";
            if (pro < 50) {
                width = ((5 - pro % 5) + pro) + "%";
            } else if (pro >= 50 && pro < 90) {
                width = ((2 - pro % 2) + pro) + "%";
            }
            if (lists) {
                uploadFileprocess_active.style.width = width;
                if (pro < 100) {
                    uploadFileLodaingText.innerText = "uploaded：" + width;
                } else {
                    uploadFileLodaingText.innerText = "File processing...";
                }
            } else {
              //  console.log(width);
            }
        };
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4) {
                if (xhr.status == 200 || xhr.status == 304) {
                    if (lists) {
                        uploadFileprocess_active.style.width = "100%";
                        uploadFileprocess_active.classList.remove("uploadFileError");
                        uploadFileprocess_active.classList.add("uploadFileSuccess");
                        uploadFileprocess_static.classList.remove("uploadFileError");
                        uploadFileprocess_static.classList.add("uploadFileSuccess");
                        uploadFileLodaingText.innerText = "Uploaded successfully！";
                    }
                    success(xhr.responseText);
                } else {
                    if (lists) {
                        uploadFileprocess_active.style.width = "100%";
                        uploadFileprocess_active.classList.add("uploadFileError");
                        uploadFileprocess_active.classList.remove("uploadFileSuccess");
                        uploadFileprocess_static.classList.add("uploadFileError");
                        uploadFileprocess_static.classList.remove("uploadFileSuccess");
                        uploadFileLodaingText.innerText = "Upload failed！";
                    }
                    fail(xhr.responseText);
                }
            }
        };
        // 请求结束
        xhr.onloadend = e => {
            //console.log('请求结束');
            //console.log(input_file);
            input_file.value = '';
        };
        xhr.send(data);
    };

    var success = function (d) {
        //console.log(d);

    };

    var fail = function (d) {
        //console.log(d)
    };

    var getPath = function () {
        var jsPath = document.currentScript ? document.currentScript.src : function () {
            var js = document.scripts
                , last = js.length - 1
                , src;
            for (var i = last; i > 0; i--) {
                if (js[i].readyState === 'interactive') {
                    src = js[i].src;
                    break;
                }
            }
            return src || js[last].src;
        }();
        return jsPath.substring(0, jsPath.lastIndexOf('/') + 1);
    }();

    //追加函数
    var props = function () {
        if (!Array.prototype.forEach) {
            Array.prototype.forEach = function (callback, thisArg) {
                var T, k;
                if (this == null) {
                    throw new TypeError(" this is null or not defined");
                }
                var O = Object(this);
                var len = O.length >>> 0; // Hack to convert O.length to a UInt32
                if ({}.toString.call(callback) != "[object Function]") {
                    throw new TypeError(callback + " is not a function");
                }
                if (thisArg) {
                    T = thisArg;
                }
                k = 0;
                while (k < len) {
                    var kValue;
                    if (k in O) {
                        kValue = O[k];
                        callback.call(T, kValue, k, O);
                    }
                    k++;
                }
            };
        }

        if (!("classList" in document.documentElement)) {
            Object.defineProperty(HTMLElement.prototype, 'classList', {
                get: function () {
                    var self = this;

                    function update(fn) {
                        return function (value) {
                            var classes = self.className.split(/\s+/g),
                                index = classes.indexOf(value);

                            fn(classes, index, value);
                            self.className = classes.join(" ");
                        }
                    }

                    return {
                        add: update(function (classes, index, value) {
                            if (!~index) classes.push(value);
                        }),

                        remove: update(function (classes, index) {
                            if (~index) classes.splice(index, 1);
                        }),

                        toggle: update(function (classes, index, value) {
                            if (~index)
                                classes.splice(index, 1);
                            else
                                classes.push(value);
                        }),

                        contains: function (value) {
                            return !!~self.className.split(/\s+/g).indexOf(value);
                        },

                        item: function (i) {
                            return self.className.split(/\s+/g)[i] || null;
                        }
                    };
                }
            });
        }
    }();
    return uploads;
})();