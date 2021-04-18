const followBtnClickHandler = () => {
    const followBtn = document.querySelector('.nb-follow-btn');
    if (!followBtn) return;
    followBtn.style["background"] = 'linear-gradient(to right, #74ebd5, #acb6e5)';


    const toggleFollowText = () => {
     
        followBtn.value === "Unfollow" ? followBtn.value = "Follow Author" : followBtn.value = "Unfollow";
              
    };

    followBtn.addEventListener('click', toggleFollowText);
}

document.addEventListener("turbolinks:load", followBtnClickHandler());