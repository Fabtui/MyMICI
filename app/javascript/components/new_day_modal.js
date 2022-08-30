const dayDivs = document.querySelectorAll('.day-not-created')

const newDayModal = () => {
  if (dayDivs) {
    console.log('coucou');
    dayDivs.forEach( dayDiv => {
      dayDiv.addEventListener( 'click', () => {
        console.log('click');
        window.scrollTo(0, 0)
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
          fetch(`/create_day?date=${date}`, {
            method: 'GET',
            headers: {
              'X-Requested-With': 'XMLHttpRequest'
            }
          })
          // .then(document.location.href='/')
          // .then(response => console.log(response))
        })
      } )
    } )
  }
};

export { newDayModal };
