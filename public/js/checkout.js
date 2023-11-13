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


// Tính giá tiền
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

      // Tạo một khối màu cho mỗi sản phẩm
    const colorStyle = prod.color ? `background-color: ${prod.color};` : '';
    const colorBlock = `<div style="display: inline-block; width: 20px; height: 20px; border: 1px solid #000; ${colorStyle}"></div>`;

    // Cập nhật để hiển thị kích cỡ sản phẩm
    const sizeText = prod.size ? prod.size : 'N/A'; // Sử dụng giá trị đã lưu trữ hoặc hiển thị 'N/A' nếu không có thông tin kích cỡ
    const productTextDiv = document.createElement('div');
    productTextDiv.classList.add('product-item');
    productTextDiv.innerHTML = `
      <div class="all" style="display: flex; justify-content: space-between;">
        <div><img src="${prod.thumbnail}" alt="${prod.name}" style="width: 200px; margin: 0 20px;"></div>
        <div>
          <p><strong>${prod.name}</strong></p>
          <p>Color: ${colorBlock}</p>
          <p class="checkout-size">Size: ${sizeText}</p> <!-- Cập nhật ở đây -->
          <p>Qty: ${prod.quantity}</p>
          <p>Price: ${prod.price} $</p>
        </div>
      </div>
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

// Lấy thông tin từ localStorage và cập nhật số lượng khi trang tải
document.addEventListener("DOMContentLoaded", function () {
  const checkoutSizeElements = document.querySelectorAll(".checkout-size");

  // Hàm cập nhật kích thước trên trang checkout
  function updateCheckoutSizes() {
      const productList = JSON.parse(localStorage.getItem("carts") || "[]");

      checkoutSizeElements.forEach((element, index) => {
        let size = "N/A"; // Mặc định là "N/A" nếu không có thông tin kích cỡ
        if (productList[index].type === 'clothing') {
            size = productList[index].clothing_size || "N/A";
        } else if (productList[index].type === 'shoe') {
            size = productList[index].shoe_size || "N/A";
        }
        element.textContent = `Size: ${size}`;
      });
  }

  // Cập nhật kích thước khi trang tải
  updateCheckoutSizes();

  // Lắng nghe sự kiện khi có thay đổi trong giỏ hàng
  window.addEventListener("storage", function (event) {
      if (event.key === "carts") {
          // Cập nhật kích thước khi giỏ hàng thay đổi
          updateCheckoutSizes();
      }
  });
});

document.addEventListener("DOMContentLoaded", function () {
  const sizeSelects = document.querySelectorAll('.size-select, .shoe-size-select');

  sizeSelects.forEach((select, index) => {
    select.addEventListener('change', (event) => {
      const selectedSize = event.target.value;
      const isClothing = event.target.classList.contains('size-select');
      const key = isClothing ? 'clothing_size' : 'shoe_size';
      const productList = JSON.parse(localStorage.getItem('carts') || '[]');

      productList[index][key] = selectedSize;
      localStorage.setItem('carts', JSON.stringify(productList));

      updateCheckoutSizes(); // Cập nhật kích thước mới lên trang
    });
  });
});

