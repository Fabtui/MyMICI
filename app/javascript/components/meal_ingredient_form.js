const revealFormButton = document.querySelector('#add-meal-btn')

const mealFormReveal = () => {
  if (revealFormButton) {
    revealFormButton.addEventListener( 'click', () => {
      const newMealForm = document.querySelector('.new-meal-ingredient-form')
      newMealForm.style.display = 'block'
    })
  }
  const removeMealButton = document.querySelector('#btn-annuler')
  if (removeMealButton) {
    removeMealButton.addEventListener( 'click', () => {
      const newMealForm = document.querySelector('.new-meal-ingredient-form')
      newMealForm.style.display = 'none'
    })
  }
};

export { mealFormReveal };
