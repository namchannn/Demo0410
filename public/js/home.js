(() => {
    document.addEventListener("DOMContentLoaded", function () {
        axios.get('http://localhost:3333/api/products').then(function (response) {
            if (response.status === 200) {
                const productListEl = document.getElementById('product-list');
                const productData = response.data;
            
   // Lấy các phần tử DOM
const chatBot = document.getElementById("chatBot");
const openChatButton = document.getElementById("openChat");
const toggleChat = document.getElementById("toggleChat");
const userInput = document.getElementById("userInput");
const sendMessage = document.getElementById("sendMessage");

// Định nghĩa các phản hồi tĩnh
const responses = {
  "Xin chào": "MADAMBOUTIQUE Chào bạn, tôi có thể giúp gì cho bạn?",
  "xin chào": "MADAMBOUTIQUE Chào bạn, tôi có thể giúp gì cho bạn?",
  "Chào": "MADAMBOUTIQUE Chào bạn, tôi có thể giúp gì cho bạn?",
  "Chao": "MADAMBOUTIQUE Chào bạn, tôi có thể giúp gì cho bạn?",
  "chào": "MADAMBOUTIQUE Chào bạn, tôi có thể giúp gì cho bạn?",
  "hello": "MADAMBOUTIQUE Chào bạn, tôi có thể giúp gì cho bạn?",
  "Giờ mở cửa": "Chúng tôi mở cửa từ 9 giờ sáng đến 5 giờ chiều.",
  "gio mo cua": "Chúng tôi mở cửa từ 9 giờ sáng đến 5 giờ chiều.",
  "giờ mở cửa": "Chúng tôi mở cửa từ 9 giờ sáng đến 5 giờ chiều."
  // Thêm các câu hỏi và câu trả lời khác ở đây
};

// Hiển thị/ẩn chat bot khi nhấn nút X
toggleChat.addEventListener("click", function () {
  chatBot.classList.toggle("show-chat");
});

// Gửi tin nhắn và nhận phản hồi khi nhấn nút Gửi
sendMessage.addEventListener("click", function () {
  const userMessage = userInput.value;

  // Xử lý tin nhắn của người dùng
  const chatContent = chatBot.querySelector(".chat-content");
  const userMessageElement = document.createElement("p");
  userMessageElement.textContent = "Bạn: " + userMessage;
  chatContent.appendChild(userMessageElement);

  // Xử lý phản hồi từ chat bot
  const response = responses[userMessage] || "Xin lỗi, tôi không hiểu câu hỏi của bạn.";
  const botReplyElement = document.createElement("p");
  botReplyElement.textContent = "Chat Bot: " + response;
  chatContent.appendChild(botReplyElement);

  userInput.value = ""; // Xóa nội dung nhập
});

// Hiển thị chat bot khi nhấn nút Chat
openChatButton.addEventListener("click", function () {
  chatBot.classList.add("show-chat");
});

                productData.forEach((prod) => {
                    const productEl = document.createElement("div");
                    productEl.classList = 'product-item col-3';
                    const productContent = document.createElement("div");
                    productContent.classList = 'product discount product_filter';
                    const productBtn = document.createElement("div");
                    // productBtn.classList = 'red_button add_to_cart_button';
                    // productBtn.innerText = 'Add to cart';
                    productEl.appendChild(productContent);
                    productEl.appendChild(productBtn);
                    const productImgContainer = document.createElement("div");
                    productImgContainer.classList = 'product_image';
                    const productImage = document.createElement("img");
                    productImage.src = prod.thumbnail;
                    productImage.addEventListener('click', () => {
                        window.location.href = `../views/products.html?id=${prod.id}`;
                    });
                    productImgContainer.appendChild(productImage);
                    productContent.appendChild(productImgContainer);
                    const productInfo = document.createElement("div");
                    productInfo.classList = 'product_info';
                    const productName = document.createElement("h6");
                    productName.classList = 'product_name';
                    productName.innerText = prod.name;
                    productName.addEventListener("click", () => {
                        window.location.href = `../views/products.html?id=${prod.id}`;
                    });
                    productInfo.appendChild(productName);
                    productContent.appendChild(productInfo);
                    const productPrice = document.createElement("div");
                    productPrice.classList = 'product_price';
                    productPrice.innerText = prod.price + '$';
                    productInfo.appendChild(productPrice);
                    productContent.appendChild(productInfo);
                    productListEl.appendChild(productEl);
                });
            }
        })
    });
})();