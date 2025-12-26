# mysivi_chat_app

MySivi Assignment - Anuj Kumar , Email: aksaini0045@gmail.com

## Getting Started

1. The project follows a Clean Architecture approach, where each module has its presentation, domain, and data layers.

2. Dio is used for api calls handling

3. On the presentation layer mainly cubits are used for this small task for loading and adding new data

4. The scroll position of users and chats list on home screen is preserved using PageStorageKey

5. For getting random receieved message - https://api.quotable.io/random api is used

6. User can view the meaning of any word on chat message bubble by tapping on it. https://api.dictionaryapi.dev/api/v2/entries/en api is used to fetch the word's meaning. Bloc is used instead of cubit for this functionality

7. For Dependency Injection, get_it is skipped for now.. direct object instances are injected for saving time in this assignment

8. I have also added a simple unit test which tests only the load word meaning bloc functionality
    Test case passes when LoadedWordMeaningState state is achieved

9. Version used
    Flutter: 3.38.0
    Dart: 3.10.0

    with shorthands 

10. I tried to use all colors from const files. maybe some missed

Thanks for reading


    