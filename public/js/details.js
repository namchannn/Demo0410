(() => {
    const urlParams = new URLSearchParams(window.location.search);
const productId = urlParams.get('id');
document.addEventListener("DOMContentLoaded", () => {
    axios.get(`http://localhost:3333/api/products/${productId}`).then(function (response) {
        if (response.status === 200) {
            const productListEl = document.getElementById('product-list');
            const productData = response.data[0];
            
            // document.getElementById('list-image').innerHTML=productData.images;
           document.getElementById('product-name').innerHTML=productData.name;
           document.getElementById('description').innerHTML=productData.description;
           document.getElementById('price').innerHTML=productData.price + '$';





           document.getElementById('btn-add').addEventListener('click',()=>{
            const carts = JSON.parse(localStorage.getItem('carts')|| '[]')
            localStorage.setItem('carts',JSON.stringify(carts.concat(productData)))
    
           });
        }
    })
});

})();