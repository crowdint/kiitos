# Categories
category_one   = Kiitos::Category.create name: 'love'
category_two   = Kiitos::Category.create name: 'ownership'
category_three = Kiitos::Category.create name: 'honor'

# Kiitos
kiito_one   = Kiitos::Kiito.create title: 'I am grateful', kiitos_category: category_one, description: 'Thanks for being the way you are', state: 'enabled', image: 'image.jpg'
kiito_two   = Kiitos::Kiito.create title: 'You are a gentleman', kiitos_category: category_three, description: 'I wish there were more people like you mister', state: 'enabled', image: 'image.jpg'
kiito_three = Kiitos::Kiito.create title: 'Mr Lietuanant', kiitos_category: category_two, description: '', state: 'enabled', image: 'image.jpg'
kiito_four  = Kiitos::Kiito.create title: 'You are the man', kiitos_category: category_one, description: 'blablabla', state: 'disabled', image: 'image.jpg'
