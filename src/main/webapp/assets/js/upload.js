const upload = document.querySelector(".upload-image")

if(upload) {
  const uploadFrom = document.querySelector(".upload-image input[type='file']");
  const preview = document.querySelector(".upload-image .preview-image img")
  
  uploadFrom.addEventListener("change", function(event) {
    const file = this.files[0]
    if(file) {
      preview.src = URL.createObjectURL(file)
    }
  })
}