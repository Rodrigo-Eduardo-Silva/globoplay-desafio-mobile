import Foundation

struct Server {
    static let baseURLMovie = "https://api.themoviedb.org/3/trending/movie/day?language=pt-BR"
    static let baseURLTv = "https://api.themoviedb.org/3/trending/tv/day?language=en-US"
    static let imageURL =  "http://image.tmdb.org/t/p/w185"
    static let key = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMmYyNDE2Y2RkMDlmYmJjOTc5ZGJhYWQ2ODZjYzcyOCIsIm5iZiI6MTcyMTA4NzcxNC45MjAwMjgsInN1YiI6IjY2OGYyNjA1NmUyODg3NzRmYjJjMTEwYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MrHBpbUtqlErQoF9RpOJUcXkHFV9hbMJ6Y9v6QgMfdc"
}

//curl --request GET \
//     --url 'https://api.themoviedb.org/3/trending/movie/day?language=en-US' \
//     --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMmYyNDE2Y2RkMDlmYmJjOTc5ZGJhYWQ2ODZjYzcyOCIsIm5iZiI6MTcyMTA4NzcxNC45MjAwMjgsInN1YiI6IjY2OGYyNjA1NmUyODg3NzRmYjJjMTEwYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MrHBpbUtqlErQoF9RpOJUcXkHFV9hbMJ6Y9v6QgMfdc' \
//     --header 'accept: application/json'
