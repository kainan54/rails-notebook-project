const likeButtonClickHandler = () => {
    const likeButton = document.querySelector('.nb-like-btn');

    likeButton.value === 'Unlike' ? likeButton.style["background-color"] = '#d3d3d3' : likeButton.style["background-color"] = '#DC143C';


    const toggleLikeText = () => {
     
        if ( likeButton.value === "Unlike") {
            likeButton.value = "Like";
            likeButton.style["background-color"] = '#DC143C';
            
        } else {
            likeButton.value = "Unlike"
            likeButton.style['background-color'] = "#d3d3d3"
        }
        
    };

    likeButton.addEventListener('click', toggleLikeText);
}

document.addEventListener("turbolinks:load", likeButtonClickHandler());