import Foundation

public struct Post {
    public let author: String
    public let description: String
    public let image: String
    public let likes: Int
    public let views: Int
    
    public init(author: String, description: String, image: String, likes: Int, views: Int) {
        self.author = author
        self.description = description
        self.image = image
        self.likes = likes
        self.views = views
    }
}

public extension Post {
    static func makePosts() -> [Post] {
        return [
            Post(
                author: "vedmak.official",
                description: "Новые кадры со съемок второго сезона сериала «Ведьмак»",
                image: "post1",
                likes: 240,
                views: 312
            ),
            Post(
                author: "netology",
                description: "Нетология. Меняем карьеру через образование.",
                image: "post2",
                likes: 766,
                views: 893
            ),
            Post(
                author: "autotrade",
                description: "😍 BMW 320d xDrive M-Sport MH \n⚙️ Дата производства: 02/2022\n⚙️ Пробег: 31 200 км\n⚙️ Двигатель: 2.0 дизель (1 995–2 000 см³)\n⚙️ Мощность: 190 л.с.\n⚙️ Привод: полный xDrive (4x4)\n⚙️ Коробка: автоматическая (Steptronic)\n⚙️ Экостандарт: Euro 6\n⚙️ Цвет: белый металлик\n⚙️ Кузов: универсал (Touring)\n\n✔️ Сервисная книжка\n✔️ При регистрации\n\n🔥 Комплектация M-Sport:\n\n✔️ Спортивный пакет M\n✔️ Легкосплавные диски\n✔️ Светодиодные фары + адаптивный свет\n✔️ Рейлинги на крыше\n✔️ Электрорегулировка подвески\n✔️ Электросиденья\n✔️ Подогрев сидений\n✔️ Подогрев руля\n✔️ Обогрев лобового стекла\n✔️ Многофункциональный руль\n✔️ Навигация\n✔️ Bluetooth / USB / AUX\n✔️ DVD / ТВ\n✔️ Бесключевой запуск\n✔️ Круиз-контроль\n✔️ Климат-контроль\n✔️ Электрозеркала и стеклоподъёмники\n\n🛡 Безопасность:\n\n✔️ ABS / ESP / DSC\n✔️ Контроль дистанции\n✔️ Парктроники\n✔️ ISOFIX\n✔️ Контроль давления в шинах\n✔️ Система помощи при торможении\n✔️ Противобуксовочная система\n✔️ Система стабилизации\n✔️ Подушки безопасности (передние, боковые, задние)\n💸Цена: 1 848 423 RUB💸(с учётом растаможки и доставкой в Москву)",
                image: "post3",
                likes: 240,
                views: 312
            ),
            Post(
                author: "cloth",
                description: "Polo Ralph Lauren stripped shirt - L\n*нюанс в комментариях\n2500₽ / 31$\n\nvintage 00s",
                image: "post4",
                likes: 7,
                views: 893
            )
        ]
    }
}
