const dayDivs = document.querySelectorAll('.day-not-created')

const newDayModal = () => {
  if (dayDivs) {
    dayDivs.forEach( dayDiv => {
      dayDiv.addEventListener( 'click', () => {
        const page = document.querySelector('#home-container');
        const shadow = document.querySelector('.shadow');
        const modal = document.querySelector('.new_day_modal');
        const modalTitle = document.querySelector('.modal-title');
        const formButtonDiv = document.querySelector('.form-buttons')
        const date = dayDiv.dataset.date
        page.style.filter = 'blur(4px)';
        shadow.style.display = 'flex';
        modal.style.display = 'block';
        modalTitle.innerHTML = `<p>Aucune information enregistrée pour la journée du ${date}</p>`
        formButtonDiv.innerHTML = `<a class="btn btn-danger btn-annuler" href='#'>Retour</a><a class="btn btn-primary btn-new-day" href='#'>Créer cette journée</a>`

        const btnAnnuler = document.querySelector('.btn-annuler')
        btnAnnuler.addEventListener('click', () => {
          document.location.href='/'
        })

        const btnNewDay = document.querySelector('.btn-new-day')
        btnNewDay.addEventListener('click', () => {
          fetch(`/days?date=${date}`, {
            method: 'POST',
            headers: {
              'X-Requested-With': 'XMLHttpRequest'
            },
            body: "",
          })
          // .then(document.location.href='/')
          .then(response => console.log(response))
        })
      } )
    } )
  }
};

export { newDayModal };
