# Описание проектов
### 1 Star Wars
Приложение c таблицей героев Star Wars, которое:<br/>
1. Делает запрос в сеть для подгрузки данных c помощью Alamofire <br/>
2. Загружает изображение персонажа если есть с помощью Kingfisher и кеширует его.<br/>
3. При выборе ячейки с персонажем открывает карточку с подробной инфой о персонаже с помощью FittedSheets.
<br/>
Само API: https://akabab.github.io/starwars-api/api/all.json<br/>
Вертска сделана с помощью кода на автолайаутах (отображение корректно на последних моделях + SE)<br/>

### 2 Stocks
Программа подггружает текущее значение акций которые нам интересны и показывает как они изменились. Работа с URLSession.
### 3 Instagram профиль 
Реализация инстаграмм профиля с функционалом:<br/>
1)есть строка поиска<br/>
2)удаление через свой delegate <br/>
3)реализация completion блоков которые передают в контроллеры информацию <br/>
4)блоки сделаны асинхроны с ипользованием GCD и OperationBlock<br/>
5)по нажатию на публикацию из collectionView переходит в TableView и скроллит до нужной публикции.<br/>
Работа с Многопоточностью.Проект сделан на  МVС.
### 4 Loveat
Приложение реализует сборник рецептов, работал в этом приложении с  TabBar,NavigationController,TableView
### 5 VK News
приложение при входе требует логин и пароль "1", если нет то прижеление выдаст ошибка, если все правильно то перейдет на страницу в раздел новости, по нажатию на автарку выплавает окно которое показывает инофрмацию о пользователе.
### 6 Avito_Page
Приложение подгружает все из файла JSON<br/>
- Элементы на сером фоне из примера и кнопка "Выбрать" кликабельные, крестик нет<br/>
- При нажатии на элемент он выделяется (отмечается синей галочкой) или отменяется<br/>
- Одновременно может быть отмечен только один элемент<br/>
- При нажатии кнопки выбора показывается алерт с названием выбраной услуги<br/>
- Подгрузка данных с помощью URLSession<br/>
- Сохранение пользовательских натсроек с помощью UserDefaults<br/>
### 7 ToDoList
Приложение реализует список дел с помощью CoreData<br/>

