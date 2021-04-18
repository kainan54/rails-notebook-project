const likeButtonClickHandler = () => {
    const likeButton = document.querySelector('.nb-like-btn');
    if (!likeButton) return;

    likeButton.value === 'Unlike' ? likeButton.style["background"] = 'linear-gradient(to right, #74ebd5, #acb6e5)' : likeButton.style["background"] = 'linear-gradient(to right, #cb356b, #bd3f32)';


    const toggleLikeText = () => {
     
        if ( likeButton.value === "Unlike") {
            likeButton.value = "Like";
            likeButton.style['background'] = "linear-gradient(to right, #cb356b, #bd3f32)"
            
        } else {
            likeButton.value = "Unlike"
            likeButton.style["background"] = 'linear-gradient(to right, #74ebd5, #acb6e5)';
        }
        
    };

    likeButton.addEventListener('click', toggleLikeText);
}

document.addEventListener("turbolinks:load", likeButtonClickHandler());