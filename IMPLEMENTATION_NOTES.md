# Что где сделано и как добавить картинки

## Структура проекта и кто за что отвечает

| Файл | Назначение |
|------|------------|
| **AppDelegate.swift** | Точка входа приложения, конфигурация сцены (явно указан `SceneDelegate`). |
| **SceneDelegate.swift** | Создаёт окно, Tab Bar с двумя вкладками (Лента, Профиль), иконки через SF Symbols. |
| **FeedViewController.swift** | Лента. Хранит пост `Post(title: "Первый пост")`, кнопка «Открыть пост» → push на `PostViewController` с передачей поста. |
| **PostViewController.swift** | Экран поста. Принимает `post`, ставит его `title` в заголовок, фон `view` — индиго. В навбаре кнопка Info → модально открывает `InfoViewController`. |
| **InfoViewController.swift** | Модальный экран. Кнопка «Показать алерт» → `UIAlertController` с двумя действиями; при нажатии в консоль идёт `print`. |
| **ProfileViewController.swift** | Профиль (пока только фон и заголовок из SceneDelegate). |
| **Post.swift** | Модель поста: `struct Post { var title: String }`. |

---

## Картинки в Tab Bar: два способа

### 1. SF Symbols (сейчас так и сделано)

**Что это:** встроенные иконки Apple, без своих файлов и Assets.

**Как использовать:**
- В коде: `UIImage(systemName: "имя_символа")`.
- Имена смотри в приложении **SF Symbols** (Xcode → Open Developer Tool → SF Symbols) или на [developer.apple.com/sf-symbols](https://developer.apple.com/sf-symbols/).

**В проекте (SceneDelegate):**
```swift
feedViewController.tabBarItem = UITabBarItem(
    title: "Лента",
    image: UIImage(systemName: "newspaper"),  // иконка ленты
    tag: 0
)
profileViewController.tabBarItem = UITabBarItem(
    title: "Профиль",
    image: UIImage(systemName: "person"),     // иконка профиля
    tag: 1
)
```

**Плюсы:** ничего не нужно добавлять в проект, иконки масштабируются и под тёмную тему.

---

### 2. Свои картинки через Assets.xcassets

**Когда нужно:** свои иконки (логотип, уникальный дизайн).

**Как добавить:**

1. В проекте открой **Assets.xcassets** (в левом списке файлов).
2. Внизу списка слева нажми **+** → **Image Set**.
3. Дай имя, например `TabFeed` (без пробелов).
4. В правой панели в **Attributes** выбери **Scales**: Single / Double / Triple (или оставь по умолчанию).
5. Перетащи картинки в слоты 1x, 2x, 3x (или одну — Xcode подставит её куда нужно).

**Размеры для Tab Bar:** обычно 25×25 pt (значит 25, 50, 75 px для 1x, 2x, 3x). Иконка должна быть без лишних отступов, по центру.

**Как использовать в коде:**
```swift
feedViewController.tabBarItem = UITabBarItem(
    title: "Лента",
    image: UIImage(named: "TabFeed"),   // имя Image Set из Assets
    tag: 0
)
```

**Важно:** для Tab Bar лучше использовать шаблонные изображения (одним цветом), чтобы система сама подкрашивала иконку при выборе вкладки. В Attributes для Image Set включи **Render As** → **Template Image**.

---

## Поток экранов

1. Запуск → Tab Bar: вкладки «Лента» и «Профиль».
2. Лента → кнопка «Открыть пост» → **push** `PostViewController` (в стеке навигации), заголовок = пост, фон индиго.
3. На экране поста → кнопка Info в навбаре → **модально** показывается `InfoViewController`.
4. На Info → кнопка «Показать алерт» → алерт с «ОК» и «Отмена»; при нажатии в консоль пишется сообщение.

После этого можно спокойно идти спать.
