function edit() {
    window.location.href = '../views/cart.html';
}

document.addEventListener("DOMContentLoaded", function() {
    // Ẩn phần "payment-info" ban đầu
    const paymentInfo = document.querySelector(".payment-info");
    paymentInfo.style.display = "none";

    // Lắng nghe sự kiện khi nút "SAVE & CONTINUE" được nhấn
    const saveAndContinueBtn = document.querySelector(".btn2");
    saveAndContinueBtn.addEventListener("click", function(event) {
      event.preventDefault();
      
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


// Biến để lưu giữ phí vận chuyển
let shippingFee = 0;
// Thêm sự kiện click cho button "SHIP"
shipButton.addEventListener('click', function() {
    // Hiển thị phần "cart-moneyship" tại vị trí ban đầu
    cartMoneyShip.style.display = 'table-row';
    // Thay đổi lớp CSS của nút "SHIP" để đổi màu
    shipButton.classList.add('selected');
    // Bỏ lớp CSS "selected" khỏi nút "PICK UP" (nếu có)
    pickUpButton.classList.remove('selected');

    // Cập nhật phí vận chuyển khi chọn "SHIP"
    shippingFee = 5; // Giả sử phí vận chuyển là $5
    updateCartTotals(); // Cập nhật tổng tiền khi số lượng thay đổi
});


// Thêm sự kiện click cho button "PICK UP"
pickUpButton.addEventListener('click', function() {
    // Ẩn phần "cart-moneyship"
    cartMoneyShip.style.display = 'none';
    // Thay đổi lớp CSS của nút "PICK UP" để đổi màu
    pickUpButton.classList.add('selected');
    // Bỏ lớp CSS "selected" khỏi nút "SHIP" (nếu có)
    shipButton.classList.remove('selected');

    // Đặt phí vận chuyển về 0 khi chọn "PICK UP"
    shippingFee = 0;
    updateCartTotals(); // Cập nhật tổng tiền khi số lượng thay đổi
});



function updateCartTotals() {
    const productList = JSON.parse(localStorage.getItem('carts') || '[]');
    let subtotal = 0;
  
    productList.forEach(prod => {
      subtotal += prod.price * prod.quantity; // Giả sử mỗi sản phẩm đều có trường 'quantity'
    });
  
    const vat = subtotal * 0.1; // VAT là 10% của Sub Total
    const totalPayment = subtotal + vat + shippingFee;
  
    document.getElementById('subtotal').textContent = `${subtotal.toFixed(2)} $`;
    document.getElementById('vat').textContent = `${vat.toFixed(2)} $`;
    document.getElementById('total-payment').textContent = `${totalPayment.toFixed(2)} $`;
}


(() => {
    console.log(JSON.parse(localStorage.getItem('carts') || '[]'));
    const productList = JSON.parse(localStorage.getItem('carts') || '[]');
    const productListImgEl = document.getElementById('cart-product-img');
    const productListTextEl = document.getElementById('cart-product');
    
    productList.forEach((prod, index) => {
      // Hiển thị hình ảnh sản phẩm
      const productImgDiv = document.createElement('div');
      productImgDiv.classList.add('product-item');  // Thêm lớp CSS
      productImgDiv.innerHTML = `
        <img src="${prod.thumbnail}" alt="${prod.name}">
      `;
      productListImgEl.appendChild(productImgDiv);
  
      // Hiển thị thông tin văn bản sản phẩm
      const productTextDiv = document.createElement('div');
      productTextDiv.classList.add('product-item');  // Thêm lớp CSS
      productTextDiv.innerHTML = `
        <p><strong>${prod.name}</strong></p>
        <p>Color: ${prod.color}</p>
        <p>Size: ${prod.size || 'N/A'}</p>
        <p class="checkout-quantity">Qty: </p>
        <p>Price: ${prod.price} $</p>
      `;
  
      productListTextEl.appendChild(productTextDiv);
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
  
  

  // Lấy giá trị input type number bên trang cart
  document.addEventListener("DOMContentLoaded", function () {
    const checkoutQuantityElements = document.querySelectorAll(".checkout-quantity");
  
    // Hàm cập nhật số lượng trên trang checkout
    function updateCheckoutQuantities() {
      const productList = JSON.parse(localStorage.getItem("carts") || "[]");
  
      checkoutQuantityElements.forEach((element, index) => {
        const quantity = productList[index].quantity || 1;
        element.textContent = `Qty: ${quantity}`;
      });
    }
  
    // Cập nhật số lượng khi trang tải
    updateCheckoutQuantities();
  
    // Lắng nghe sự kiện khi có thay đổi trong giỏ hàng
    window.addEventListener("storage", function (event) {
      if (event.key === "carts") {
        // Cập nhật số lượng khi giỏ hàng thay đổi
        updateCheckoutQuantities();
      }
    });
  });
  


// điều kiện để hiện thông báo
var myButton = document.getElementById('btn3');

myButton.addEventListener('click', function() {
    const paymentMethod = document.querySelector(".paymenthod").value; // Lấy phương thức thanh toán
    const paymentDetails = document.querySelector(".payment-details"); // Lấy form thông tin thanh toán

    if (paymentMethod === "2" || paymentMethod === "1") {
      if (paymentMethod === "2") {
          // Nếu là "Internet Banking," kiểm tra và hiển thị thông báo dựa trên việc điền đầy đủ thông tin
          if (paymentDetailsIsFilled(paymentDetails)) {
              alert('Payment success! Thank you for your order.');
          } else {
              alert('Please fill in all information before continuing.');
          }
      } else {
          // Nếu là "Cash," hiển thị thông báo thành công ngay lập tức
          alert('Payment success! Thank you for your order.');
      }
  } else {
      // Nếu chưa chọn phương thức thanh toán, hiển thị thông báo yêu cầu chọn phương thức thanh toán
      alert('Please select payment method.');
  }
});

function paymentDetailsIsFilled(paymentDetails) {
    // Hàm kiểm tra thông tin thanh toán đã được điền đầy đủ hay chưa
    const inputFields = paymentDetails.querySelectorAll('input');
    for (const field of inputFields) {
        if (!field.value.trim()) {
            return false; // Nếu có trường nào chưa được điền, trả về false
        }
    }
    return true; // Nếu tất cả trường đã được điền đầy đủ, trả về true
}

