# Earnitest

`Earnitest` software application is a Flutter-based mobile application that demonstrates my development skills by loading and displaying grids of image data obtained from Unsplash APIs. It serves as a showcase to evaluate my proficiency in Flutter development.

## Key Implementations and Approaches
### Code Structure
    The stucture and implementation of this project closely follows the Clean Architecture principle that promotes separation of concerns and modularization to build maintainable and scalable applications. It helps in achieving code organization, testability, and flexibility. 

### Image Loading: 
    The application utilizes the Unsplash APIs to fetch image data, such as URLs or metadata, from the Unsplash platform.

### Grid Display: 
    The fetched image data is presented in a visually appealing grid format within the application. Each grid item include a preview thumbnail or other relevant information.

### Pagination: 
    To handle a potentially large amount of image data, this application implements pagination to load and display images in batches or as the user scrolls through the items.

### Short Image Details: 
    Upon selecting an image from the grid, the application provide and enlarged detailed image and Photographer's name and a short description of the photo/image. 

### Error Handling: 
    A robust error handling and graceful fallback systems have been implemented to handle scenarios like network issues or API failures with clear error messages to ensure a seamless user experience.

### Custom Animation: 
    I have implemented custom page routing and light animations across the application to improve the experience


## Future Implementations

 ### Image Search: 

    I intend to incorporate a search functionality that allows users to search for specific images based on keywords, categories, or other parameters provided by the Unsplash API.



## Performace Optimizations

1. ### Widget Tree Optimization:
    a. I have the widget tree and removed all unnecessary or redundant widgets.

    b. I used `const` constructors for all widgets that don't need to rebuild frequently.

    c. I have also taken time to split most UI components into smaller, reusable widgets to promote code organization and ease of maintenance.

2. ### State Management:
    I implemented BLoC Statement as provides a robust solution for managing state in Flutter applications. It allows you to manage and react to changes in state efficiently, ensuring that the UI reflects the most up-to-date data. BLoC typically uses streams and reactive programming to handle state updates, making it a powerful mechanism for handling complex state management scenarios.

3. ### Dependency Injection
    An efficient method for passing and utilizing dependencies through out the application has been implemented with help of the get_it Flutter package, which aims at making unit testing hassle-free.

4. ### Lazy Loading
    I have implement lazy loading to fetch and render data as the user scrolls, instead of loading everything upfront, by utilizing a GridView related package and implementing GridView.build, which is the recommended approach for building grids of widgets on-demand.

5. ### Image Optimization:
    a. I have optimize images loading by utilizing the smaller or thumbnail sizes supplied by the Unsplash API without compromising quality.

    b. I implemented fast_cached_network_image to efficiently cache and load remote images.
