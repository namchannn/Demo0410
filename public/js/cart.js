function checkout() {
    window.location.href = '../views/checkout.html'; 
}
function shopping() {
    window.location.href = '../views/categories.html'; 
}


(()=>{console.log(JSON.parse(localStorage.getItem('carts')||'[]'));
const productList = JSON.parse(localStorage.getItem('carts')||'[]')
productList.forEach((prod) => {
    const productItem = document.createElement('tr')
    const productListEl = document.getElementById('product-list')
    const parser = new DOMParser();
const doc = parser.parseFromString( `<tr>
<td><img src="../images/single_3_thumb.jpg" alt=""></td>
<td><p id="product-name"></p></td>
<td><p>Black</p></td>
<td><p>L</p></td>
<td><input type="number" value="1" min="1"></td>
<td><p>410.00 $</p></td>
<td><span>X</span></td>
</tr>`, 'text/html');
    productListEl.appendChild(doc)
    document.getElementById('product-name').innerHTML=prod.name;
    // const productEl = document.createElement("div");
    // productEl.classList = 'product-item col-3';
    // const productContent = document.createElement("div");
    // productContent.classList = 'product discount product_filter';
    // const productBtn = document.createElement("div");
    // productBtn.classList = 'red_button add_to_cart_button';
    // productBtn.innerText = 'Add to cart';
    // productEl.appendChild(productContent);
    // productEl.appendChild(productBtn);
    // const productImgContainer = document.createElement("div");
    // productImgContainer.classList = 'product_image';
    // const productImage = document.createElement("img");
    // productImage.src = prod.thumbnail;
    // productImgContainer.appendChild(productImage);
    // productContent.appendChild(productImgContainer);
    // const productInfo = document.createElement("div");
    // productInfo.classList = 'product_info';
    // const productName = document.createElement("h6");
    // productName.classList = 'product_name';
    // productName.innerText = prod.name;
    // productInfo.appendChild(productName);
    // productContent.appendChild(productInfo);
    // const productPrice = document.createElement("div");
    // productPrice.classList = 'product_price';
    // productPrice.innerText = prod.price + '$';
    // productInfo.appendChild(productPrice);
    // productContent.appendChild(productInfo);
    // productListEl.appendChild(productEl);
});
})()

