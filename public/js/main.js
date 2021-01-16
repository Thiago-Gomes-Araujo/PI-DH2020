let cards = document.querySelectorAll('.card');
let cards1 = document.querySelectorAll('.card-1');

for (let i = 0; i < cards.length; i++) {
  cards[i].addEventListener('mouseover',function(){
    this.classList.add('grow');
    this.classList.remove('shrink');
  })

  cards[i].addEventListener('mouseout',function(){
    this.classList.remove('grow');
    this.classList.add('shrink');
  })
}

for (let i = 0; i < cards1.length; i++) {
  cards1[i].addEventListener('mouseover',function(){
    this.classList.add('grow');
    this.classList.remove('shrink');
  })

  cards1[i].addEventListener('mouseout',function(){
    this.classList.remove('grow');
    this.classList.add('shrink');
  })
}

let logo = document.querySelector('.logo');
 logo.addEventListener('mouseover', function(){
   logo.style.transform = 'rotate(180deg)'
 });

 logo.addEventListener('mouseout', function(){
  logo.style.transform = 'rotate(0deg)'
})