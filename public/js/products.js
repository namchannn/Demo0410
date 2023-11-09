// (() => {
//     document.addEventListener("DOMContentLoaded", () => {
//         axios.get('http://localhost:3333/api/products/:id').then(function (response) {
//             if (response.status === 200) {
//                 const productListEl = document.getElementById('product-list');
//                 const productData = response.data;

//                 productData.forEach((prod) => {
//                     const productEl = document.createElement("div");
//                     productEl.classList = 'product-item col-3';
//                     const productContent = document.createElement("div");
//                     productContent.classList = 'product discount product_filter';
//                     const productBtn = document.createElement("div");
//                     productBtn.classList = 'red_button add_to_cart_button';
//                     productBtn.innerText = 'Add to cart';
//                     productEl.appendChild(productContent);
//                     productEl.appendChild(productBtn);
//                     const productImgContainer = document.createElement("div");
//                     productImgContainer.classList = 'product_image';
//                     const productImage = document.createElement("img");
//                     productImage.src = prod.thumbnail;
//                     productImgContainer.appendChild(productImage);
//                     productContent.appendChild(productImgContainer);
//                     const productInfo = document.createElement("div");
//                     productInfo.classList = 'product_info';
//                     const productName = document.createElement("h6");
//                     productName.classList = 'product_name';
//                     productName.innerText = prod.name;
//                     productInfo.appendChild(productName);
//                     productContent.appendChild(productInfo);
//                     const productPrice = document.createElement("div");
//                     productPrice.classList = 'product_price';
//                     productPrice.innerText = prod.price + '$';
//                     productInfo.appendChild(productPrice);
//                     productContent.appendChild(productInfo);
//                     productListEl.appendChild(productEl);
//                 });
//             }
//         })
//     });
// })();

(() => {
    document.addEventListener("DOMContentLoaded", () => {
      axios.get('http://localhost:3333/api/products/:id').then(function (response) {
        if (response.status === 200) {
          const productListEl = document.getElementById('product-list');
          const productData = response.data;
  
          productData.forEach((prod) => {
            const productRow = document.createElement('tr');
            productRow.innerHTML = `
              <td><img src="${prod.thumbnail}" alt="${prod.name}"></td>
              <td><p class="product-name">${prod.name}</p></td>
              <td><p>${prod.color || 'N/A'}</p></td>
              <td><p>N/A</p></td> <!-- Giả sử không có thông tin size từ API -->
              <td><input type="number" value="1" min="1" class="quantity-input"></td>
              <td><p class="product-price">${prod.price} $</p></td>
              <td><button class="remove-product">X</button></td>
            `;
  
            // Thêm sản phẩm vào giỏ hàng
            const addToCartButton = document.getElementById('btn-add');
            addToCartButton.textContent = 'Add to cart';
            addToCartButton.addEventListener('click', () => {
              addProductToCart(prod);
              updateCartTotals();
            });
  
            // Thêm nút "Add to cart" vào dòng sản phẩm
            const addToCartCell = document.createElement('td');
            addToCartCell.appendChild(addToCartButton);
            productRow.appendChild(addToCartCell);
  
            productListEl.appendChild(productRow);
          });
        }
      });
    });
  
    function addProductToCart(product) {
      const cart = JSON.parse(localStorage.getItem('carts') || '[]');
      cart.push({ ...product, quantity: 1 }); // Thêm trường quantity
      localStorage.setItem('carts', JSON.stringify(cart));
    }
  
    function showAddToCartNotification(productName) {
      // Tạo thông báo
      const notification = document.createElement('div');
      notification.classList.add('cart-notification');
      notification.textContent = `Đã thêm "${productName}" vào giỏ hàng.`;
      document.body.appendChild(notification);
  
      // Đặt thời gian để ẩn thông báo sau vài giây
      setTimeout(() => {
        notification.remove();
      }, 3000); // Thông báo sẽ tự động biến mất sau 3 giây
    }

  
    function updateCartTotals() {
      // ... (như trong code trước)
    }   

    showAddToCartNotification(product.name); // Hiển thị thông báo
  })();
  
  