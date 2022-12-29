const upload = document.querySelector(".upload-image")

if(upload) {
  const uploadFrom = document.querySelector(".upload-image input[type='file']");
  const preview = document.querySelector(".upload-image .preview-image")
  uploadFrom.addEventListener("change", function(event) {
    const files = this.files;
    for(let file of files) {
      preview.innerHTML += `<img src="${URL.createObjectURL(file)}" style="width: 10rem">`
    }
  })
}