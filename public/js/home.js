(() => {
    document.addEventListener("DOMContentLoaded", () => {
        axios.get('http://localhost:3333/api/products').then(function (response) {
            if (response.status === 200) {
                const productListEl = document.getElementById('product-list');
                const productData = response.data;
                // <div class="product-item">
                // 			<div class="product discount product_filter">
                // 				<div class="product_image">
                // 					<img src="../images/product_1.png" alt="">
                // 				</div>
                // 				<div class="favorite favorite_left"></div>
                // 				<div
                // 					class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">
                // 					<span>-$20</span></div>
                // 				<div class="product_info">
                // 					<h6 class="product_name"><a href="../views/product.html">Fujifilm X100T 16 MP
                // 							Digital Camera (Silver)</a></h6>
                // 					<div class="product_price">$520.00<span>$590.00</span></div>
                // 				</div>
                // 			</div>
                // 			<div class="red_button add_to_cart_button"><a href="#">add to cart</a></div>
                // 		</div>
                productData.forEach((prod) => {
                    const productEl = document.createElement("div");
                    productEl.classList = 'product-item';
                    const productContent = document.createElement("div");
                    productContent.classList = 'product discount product_filter';
                    const productBtn = document.createElement("div");
                    productBtn.classList = 'red_button add_to_cart_button';
                    productBtn.innerText = 'Add to cart';
                    productEl.appendChild(productContent);
                    productEl.appendChild(productBtn);
                    const productImgContainer = document.createElement("div");
                    productImgContainer.classList = 'product_image';
                    const productImage = document.createElement("img");
                    productImage.src = prod.thumbnail;
                    productImgContainer.appendChild(productImage);
                    productContent.appendChild(productImgContainer);
                    const productInfo = document.createElement("div");
                    productInfo.classList = 'product_info';
                    const productName = document.createElement("h6");
                    productName.classList = 'product_name';
                    productName.innerText = prod.name;
                    productInfo.appendChild(productName);
                    productContent.appendChild(productInfo);
                    const productPrice = document.createElement("div");
                    productPrice.classList = 'product_price';
                    productPrice.innerText = prod.price;
                    productInfo.appendChild(productPrice);
                    productContent.appendChild(productInfo);
                    
                    productListEl.appendChild(productEl);
                });
            }
        })
    });
})();