function checkout() {
    window.location.href = '../views/checkout.html'; 
}
function shopping() {
    window.location.href = '../views/categories.html'; 
}


(() => {
    console.log(JSON.parse(localStorage.getItem('carts') || '[]'));
    const productList = JSON.parse(localStorage.getItem('carts') || '[]');
    const productListEl = document.getElementById('product-list');
    
    productList.forEach((prod, index) => {
      const productRow = document.createElement('tr');
      productRow.innerHTML = `
        <td><img src="${prod.thumbnail}" alt="${prod.name}"></td>
        <td><p class="product-name">${prod.name}</p></td>
        <td><p>${prod.color}</p></td>
        <td><p>${prod.size || 'N/A'}</p></td>
        <td><input type="number" value="1" min="1"></td>
        <td><p>${prod.price} $</p></td>
        <td><span class="remove-product" data-index="${index}">X</span></td>
      `;
      productListEl.appendChild(productRow);
    });
  
    // Add event listener for removing products from cart
    const removeButtons = document.querySelectorAll('.remove-product');
    removeButtons.forEach((button, index) => {
      button.addEventListener('click', () => {
        productList.splice(index, 1); // Remove the product from the array
        localStorage.setItem('carts', JSON.stringify(productList)); // Update the local storage
        button.parentElement.parentElement.remove(); // Remove the product row from the table
      });
    });
  })();
  

