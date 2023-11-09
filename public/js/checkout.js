document.addEventListener("DOMContentLoaded", function() {
    // Ẩn phần "payment-info" ban đầu
    const paymentInfo = document.querySelector(".payment-info");
    paymentInfo.style.display = "none";

    // Lắng nghe sự kiện khi nút "SAVE & CONTINUE" được nhấn
    const saveAndContinueBtn = document.querySelector(".btn2");
    saveAndContinueBtn.addEventListener("click", function() {
        // Hiện phần "payment-info"
        paymentInfo.style.display = "block";
    });
});

document.addEventListener("DOMContentLoaded", function() {
    // Ẩn phần "payment-details" ban đầu
    const paymentDetails = document.querySelector(".payment-details");
    paymentDetails.style.display = "none";

    // Lắng nghe sự kiện khi giá trị trong hộp chọn (select) thay đổi
    const paymentMethodSelect = document.querySelector(".paymenthod");
    paymentMethodSelect.addEventListener("change", function() {
        const selectedPaymentMethod = paymentMethodSelect.value;
        
        if (selectedPaymentMethod === "2") {
            // Nếu người dùng chọn "Internet Banking," hiện phần "payment-details"
            paymentDetails.style.display = "block";
        } else {
            // Nếu người dùng chọn "Cash" hoặc giá trị khác, ẩn phần "payment-details"
            paymentDetails.style.display = "none";
        }
    });
});



// Lấy nút "SHIP"
const shipButton = document.querySelector('.btn1:nth-child(1)');

// Lấy nút "PICK UP"
const pickUpButton = document.querySelector('.btn1:nth-child(2)');

// Lấy phần "cart-moneyship" theo id
const cartMoneyShip = document.getElementById('cart-moneyship');

// Thêm sự kiện click cho button "SHIP"
shipButton.addEventListener('click', function() {
    // Hiển thị phần "cart-moneyship" tại vị trí ban đầu
    cartMoneyShip.style.display = 'table-row';
    // Thay đổi lớp CSS của nút "SHIP" để đổi màu
    shipButton.classList.add('selected');
    // Bỏ lớp CSS "selected" khỏi nút "PICK UP" (nếu có)
    pickUpButton.classList.remove('selected');
});

// Thêm sự kiện click cho button "PICK UP"
pickUpButton.addEventListener('click', function() {
    // Ẩn phần "cart-moneyship"
    cartMoneyShip.style.display = 'none';
    // Thay đổi lớp CSS của nút "PICK UP" để đổi màu
    pickUpButton.classList.add('selected');
    // Bỏ lớp CSS "selected" khỏi nút "SHIP" (nếu có)
    shipButton.classList.remove('selected');
});


function edit() {
    window.location.href = '../views/cart.html';
}

(() => {
    console.log(JSON.parse(localStorage.getItem('carts') || '[]'));
    const productList = JSON.parse(localStorage.getItem('carts') || '[]');
    const productListEl = document.getElementById('cart-product-img');
    
    productList.forEach((prod, index) => {
      const productDiv = document.createElement('div');  
      productDiv.innerHTML = `
      <img src="${prod.thumbnail}" alt="${prod.name}">
      `;
      productListEl.appendChild(productDiv);
    });
})();


(() => {
    console.log(JSON.parse(localStorage.getItem('carts') || '[]'));
    const productList = JSON.parse(localStorage.getItem('carts') || '[]');
    const productListEl = document.getElementById('cart-product');
    
    productList.forEach((prod, index) => {
      const productDiv = document.createElement('div');  
      productDiv.innerHTML = `
        <p>${prod.name}</p>
        <p>Color: ${prod.color}</p>
        <p>Size: ${prod.size || 'N/A'}</p>
        <p>Qty: </p>
        <p>Price: ${prod.price} $</p>
      `;
      productListEl.appendChild(productDiv);
    });
})();
