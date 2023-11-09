function checkout() {
    window.location.href = '../views/checkout.html'; 
}
function shopping() {
    window.location.href = '../views/categories.html'; 
}


function updateCartTotals() {
  const productList = JSON.parse(localStorage.getItem('carts') || '[]');
  let subtotal = 0;

  productList.forEach(prod => {
    subtotal += prod.price * prod.quantity; // Giả sử mỗi sản phẩm đều có trường 'quantity'
  });

  const vat = subtotal * 0.1; // VAT là 10% của Sub Total
  const totalPayment = subtotal + vat;

  document.getElementById('subtotal').textContent = `${subtotal.toFixed(2)} $`;
  document.getElementById('vat').textContent = `${vat.toFixed(2)} $`;
  document.getElementById('total-payment').textContent = `${totalPayment.toFixed(2)} $`;
}

(() => {
  const productListEl = document.getElementById('product-list');
  const productList = JSON.parse(localStorage.getItem('carts') || '[]');

  // Hiển thị danh sách sản phẩm
  productList.forEach((prod, index) => {
    const productRow = document.createElement('tr');
    productRow.innerHTML = `
      <td><img src="${prod.thumbnail}" alt="${prod.name}"></td>
      <td><p class="product-name">${prod.name}</p></td>
      <td><p>${prod.color}</p></td>
      <td><p>${prod.size || 'N/A'}</p></td>
      <td><input type="number" value="${prod.quantity}" min="1" class="quantity-input" data-index="${index}"></td>
      <td><p class="product-price">${prod.price} $</p></td>
      <td><span class="remove-product" data-index="${index}">X</span></td>
    `;
    productListEl.appendChild(productRow);
  });

  updateCartTotals(); // Cập nhật tổng tiền khi tải trang

  // Xóa sản phẩm khỏi giỏ hàng
  const removeButtons = document.querySelectorAll('.remove-product');
  removeButtons.forEach((button, index) => {
    button.addEventListener('click', () => {
      productList.splice(index, 1);
      localStorage.setItem('carts', JSON.stringify(productList));
      button.parentElement.parentElement.remove();
      updateCartTotals(); // Cập nhật tổng tiền khi sản phẩm được xóa
    });
  });

  // Cập nhật số lượng sản phẩm
  const quantityInputs = document.querySelectorAll('.quantity-input');
  quantityInputs.forEach(input => {
    input.addEventListener('change', (event) => {
      const index = event.target.dataset.index;
      productList[index].quantity = event.target.value;
      localStorage.setItem('carts', JSON.stringify(productList));
      updateCartTotals(); // Cập nhật tổng tiền khi số lượng thay đổi
    });
  });
})();

