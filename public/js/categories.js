(() => {
    document.addEventListener("DOMContentLoaded", () => {
      // Xử lý khi một danh mục được chọn
      const handleCategoryChange = (category) => {
        // Xây dựng URL dựa trên danh mục
        const url = category ? `http://localhost:3333/api/categories/${category}` : `http://localhost:3333/api/products`;
        
        
        // Gọi API và xử lý kết quả
        axios.get(url)
          .then(response => {
            // Xóa danh sách sản phẩm hiện tại và hiển thị sản phẩm mới
            displayProducts(response.data);
          })
          .catch(error => {
            console.error('Có lỗi khi tải sản phẩm:', error);
          });
      };
  
      // Lắng nghe sự kiện click cho tất cả liên kết danh mục
      document.querySelectorAll('.sidebar_categories li a').forEach(link => {
        link.addEventListener('click', function (e) {
          e.preventDefault();
          
          // Xóa class 'active' và thêm vào mục được chọn
          const categoryLinks = document.querySelectorAll('.sidebar_categories li');
          categoryLinks.forEach(node => node.classList.remove('active'));
          const parentLi = this.closest('li');
          parentLi.classList.add('active');
          
          // Lấy danh mục được chọn và xử lý thay đổi
          const category = this.dataset.category;
          handleCategoryChange(category);
        });
      });
      
      // Khởi tạo danh sách sản phẩm với danh mục 'All'
      handleCategoryChange("");
    });
  
    // Hàm hiển thị sản phẩm
    function displayProducts(products) {
      const productListEl = document.getElementById('product-list');
      if (!productListEl) {
        console.error('Không tìm thấy phần tử danh sách sản phẩm.');
        return;
      }
      
      // Xóa danh sách sản phẩm hiện tại
      productListEl.innerHTML = '';
      
      // Lặp qua mỗi sản phẩm và thêm vào danh sách
      products.forEach((product) => {
            const productEl = document.createElement('div');
            productEl.classList.add('product-item'); // Sửa lại class name cho phù hợp với CSS của bạn
            
            const productDetails = document.createElement('div');
            productDetails.classList.add('product-details'); // Class name phù hợp với CSS của bạn

            const productImage = document.createElement('img');
            productImage.src = product.thumbnail;
            productImage.alt = product.name;

            const productColor = document.createElement('div');
            productColor.textContent = "color"; // Văn bản cố định
            const colorSpan = document.createElement('span');
            colorSpan.style.backgroundColor = product.color; // Giả sử 'color' là thuộc tính chứa giá trị màu
            productColor.appendChild(colorSpan);

            const productSize = document.createElement('select');
            productSize.name = "size";
            const sizes = ["M", "L", "S", "XL"];
            sizes.forEach((size) => {
            const option = document.createElement('option');
            option.value = size;
            option.textContent = size;
            productSize.appendChild(option);
            });

            const productName = document.createElement('h6');
            productName.textContent = product.name;

            const productPrice = document.createElement('h5');
            productPrice.textContent = product.price;

            productDetails.appendChild(productImage);
            productDetails.appendChild(productName);
            productDetails.appendChild(productPrice);
            productDetails.appendChild(productColor);
            productDetails.appendChild(productSize);

            productEl.appendChild(productDetails);
            productListEl.appendChild(productEl);

            productEl.addEventListener('click', () => {
              window.location.href = `../views/products.html?id=${product.id}`;
          });

          productEl.innerHTML = `
            <img src="${product.thumbnail}" alt="${product.name}">
            <h6>${product.name}</h6>
            <h5>${product.price}$</h5>`;
          productListEl.appendChild(productEl);
      });
    }

  })();
  


  
  