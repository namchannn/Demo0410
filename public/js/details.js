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
            
  // document.getElementById('list-image').innerHTML=productData.images;
  document.getElementById('product-name').innerHTML=productData.name;
  document.getElementById('description').innerHTML=productData.description;
  document.getElementById('price').innerHTML=productData.price + '$';
            
  // Update product images
  const images = productData.images.split('\r\n').filter(Boolean); // Tạo mảng của các URL hình ảnh và loại bỏ các string rỗng
  const imageContainer = document.getElementById('product-image-container');
  imageContainer.innerHTML = ''; // Clear existing images if any
  images.forEach((imageSrc, index) => {
      const li = document.createElement('li'); // Tạo phần tử li
      li.className = index === 0 ? 'active' : ''; // Đặt class 'active' cho hình đầu tiên
      const img = document.createElement('img'); // Tạo phần tử img
      img.src = imageSrc; // Đặt nguồn của img
      img.alt = productData.name; // Đặt thuộc tính alt
      // Thêm các thuộc tính khác cho img nếu cần
      li.appendChild(img); // Thêm img vào li
      imageContainer.appendChild(li); // Thêm li vào ul
  });    

  const mainImageDiv = document.getElementById('main-image');
          mainImageDiv.style.backgroundImage = `url(${productData.thumbnail})`;
          mainImageDiv.style.backgroundSize = 'cover';
          mainImageDiv.style.backgroundPosition = 'center';

           // Add to cart button event
          document.getElementById('btn-add').addEventListener('click', () => {
            const carts = JSON.parse(localStorage.getItem('carts') || '[]');
            localStorage.setItem('carts', JSON.stringify([...carts, productData]));
        });
        }
    })
});

})();