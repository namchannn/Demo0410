(() => {
    const urlParams = new URLSearchParams(window.location.search);
const productId = urlParams.get('id');

            document.addEventListener("DOMContentLoaded", () => {
                const urlParams = new URLSearchParams(window.location.search);
                const productId = urlParams.get('id');
                axios.get(`http://localhost:3333/api/products/${productId}`).then(function (response) {
                    if (response.status === 200) {
                        const productData = response.data[0];
                        const productListEl = document.getElementById('product-list');
            
 
  document.getElementById('product-name').innerHTML=productData.name;
  document.getElementById('description').innerHTML=productData.description;
  document.getElementById('price').innerHTML=productData.price + '$';
  document.getElementById('name-description1').innerHTML=productData.name;
  document.getElementById('name-description2').innerHTML=productData.name;
  document.getElementById('name-description3').innerHTML=productData.name;
  document.getElementById('description-row1').innerHTML=productData.description;
  document.getElementById('description-row2').innerHTML=productData.description;
  document.getElementById('description-row3').innerHTML=productData.description;

  updateProductColors(productData.color);
  

// Phân tích chuỗi URL của hình ảnh một lần và loại bỏ bất kỳ chuỗi trống nào
const images = productData.images.split('\r\n').filter(Boolean);

// Cập nhật các container hình ảnh riêng lẻ
const imageContainers = document.querySelectorAll('.tab_image');
images.forEach((imageSrc, index) => {
    if (imageContainers[index]) { // Kiểm tra nếu container hình ảnh cụ thể tồn tại
        const img = document.createElement('img');
        img.src = imageSrc;
        img.alt = productData.name;
        imageContainers[index].innerHTML = ''; // Xóa nội dung hiện tại của container
        imageContainers[index].appendChild(img); // Thêm phần tử img mới
    }
});

// Cập nhật container danh sách hình ảnh sản phẩm
const imageContainer = document.getElementById('product-image-container');
imageContainer.innerHTML = ''; // Xóa bỏ các hình ảnh hiện có nếu có
images.forEach((imageSrc, index) => {
    const li = document.createElement('li');
    li.className = index === 0 ? 'active' : ''; // Đặt class 'active' cho hình ảnh đầu tiên
    const img = document.createElement('img');
    img.src = imageSrc;
    img.alt = productData.name;
    // Thêm các thuộc tính img khác nếu cần
    li.appendChild(img); // Thêm img vào li
    imageContainer.appendChild(li); // Thêm li vào ul
});


  
  

  const mainImageDiv = document.getElementById('main-image');
          mainImageDiv.style.backgroundImage = `url(${productData.thumbnail})`;
          mainImageDiv.style.backgroundSize = 'cover';
          mainImageDiv.style.backgroundPosition = 'center';

          function updateProductColors(color) {
            const colorList = document.getElementById('product-colors'); // Giả sử bạn có một UL với id="product-colors"
            colorList.innerHTML = ''; // Xóa các màu sắc hiện tại
            const colorItem = document.createElement('li');
            colorItem.style.background = color;
            colorList.appendChild(colorItem);
          }        

           // Add to cart button event
          document.getElementById('btn-add').addEventListener('click', () => {
            const carts = JSON.parse(localStorage.getItem('carts') || '[]');
            localStorage.setItem('carts', JSON.stringify([...carts, productData]));
        });
        }
    })
});

})();