# No-BS-Dictionary
Minimal Dictionary App.

I feel a lot of dictionary apps on the App store do too much and are hard to navigate.
I created a No-BS Dictionary app where you look up words and it shows only the essential details: the phonetics, defintions and synonyms/antonyms. 
The design is very minimal and built using UIKit(programmatic - No Nibs or Storyboards), CoreData, and MVVM. The API used for definitions is the Free Dictionary API found at https://dictionaryapi.dev/

*Screenshots*
<img src="https://github.com/thompson-dean/No-BS-Dictionary/blob/main/screenshots/screen01.png" width=25% height=25%> <img src="https://github.com/thompson-dean/No-BS-Dictionary/blob/main/screenshots/screen02.png" width=25% height=25%> 


*What I learnt* <br>
Building the UI for this app took me about 3 iterations. Each time I would make an design choice that didn't work and have to start over on the UI. The first time I tried placing arrays of Strings(synonyms, antonyms , definitions) in their own tableviews. I literally had 3 tableview cells with in a larger tableview cell. This is not good for performance, although technically it works.(Feel free to go back a couple versions).

Thanks to some help from a mentor, I was taught that I could just dequeue many cells and pass them into a single tableview. Unfortunately I was unable to get that to work. So i had a dig around on StackOverflow and then asked another mentor for help. he gave me some tips and advice on UIStackView. I am so grateful for this mentors help as I discovered the power of UIStackView. Coming from SwiftUI, I really didn't understand how powerful UIStackViews were, as I would use them haphazardly in SwiftUI apps I had created. It was great to see the inner workings of UiTableView and UIStackView. 

Anyway, The magic code that got my synonyms stackviews and antonym stackviews look neat was:

```
let synonymButtons: [UIButton] = synonymExamples.map {
            let button = UIButton()
            button.setTitle($0, for: .normal)
            button.setTitleColor(.link, for: .normal)
            return button
        }
        
synonymButtons.forEach {
    synStackView.addArrangedSubview($0)
}
```
Peace             



