document.addEventListener('DOMContentLoaded', function() {
    const paymentInfo = document.querySelector('.payment-info');
    const paymentMethodSelect = document.querySelector('select');

    paymentMethodSelect.addEventListener('change', function() {
        if (paymentMethodSelect.value === '2') {
            paymentInfo.style.display = 'block';
        } else {
            paymentInfo.style.display = 'none';
        }
    });
});
