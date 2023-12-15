window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  const feeDisplay = document.getElementById("add-tax-price");
  const profitDisplay = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const price = parseInt(priceInput.value);
    const tax = Math.floor(price * 0.1);
    const profit = Math.floor(price - tax);

    feeDisplay.innerHTML = tax;
    profitDisplay.innerHTML = profit;
  });

});