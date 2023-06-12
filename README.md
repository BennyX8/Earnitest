# Earnitest

This is a Flutter application

## Performace Optimizations Implemented

1. ### Widget Tree Optimization:
    a. I have the widget tree and removed all unnecessary or redundant widgets.

    b. I used `const` constructors for all widgets that don't need to rebuild frequently.

    c. I have also taken time to split most UI components into smaller, reusable widgets to promote code organization and ease of maintenance.

2. ### State Management:
    I implemented BLoC Statement as provides a robust solution for managing state in Flutter applications. It allows you to manage and react to changes in state efficiently, ensuring that the UI reflects the most up-to-date data. BLoC typically uses streams and reactive programming to handle state updates, making it a powerful mechanism for handling complex state management scenarios.

3. ### Lazy Loading
    I have implement lazy loading to fetch and render data as the user scrolls, instead of loading everything upfront, by utilizing a GridView related package and implementing GridView.build, which is the recommended approach for building grids of widgets on-demand.

4. ### Image Optimization:
    a. I have optimize images loading by utilizing the smaller or thumbnail sizes supplied by the Unsplash API without compromising quality.

    b. I implemented fast_cached_network_image to efficiently cache and load remote images.

Implement caching strategies using libraries like dio or http to cache responses and reduce server round-trips.
Performance Profiling:
Use Flutter DevTools or profiling tools like flutter_bloc or flutter_redux_dev_tools to identify performance bottlenecks.
Optimize slow-performing widgets or operations identified during profiling.
Code Analysis and Optimization:
Use tools like dart analyze and dartfmt to identify and fix code issues and ensure code consistency.
Optimize heavy computations or algorithms by using efficient data structures or algorithms.