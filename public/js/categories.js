(() => {
    document.addEventListener("DOMContentLoaded", () => {
        axios.get('http://localhost:3333/api/products').then(function (response) {
            if (response.status === 200) {
                const productListEl = document.getElementById('product-list');
                const productData = response.data;

                productData.forEach((prod) => {
                    const productEl = document.createElement("div");
                    productEl.classList = 'product-item col-3';
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
                    productPrice.innerText = prod.price + '$';
                    productInfo.appendChild(productPrice);
                    productContent.appendChild(productInfo);
                    productListEl.appendChild(productEl);
                });
            }
        })
    });
})();