### 1. Удаленное конфигурирование узла через Ansible

Для начала добавляем Vagrantfile для создания трёх вм и создаем их с помощью vagrant up.

![alt text](prevs/1.png "vagrant")

Подключение к машине manager.

![alt text](prevs/2.png "vagrant2")

Пингуем вм node01 с вм manager.

![alt text](prevs/3.png "vagrant3")

Подключаемся к node01, используя vagrant ключи.

![alt text](prevs/4.png "vagrant4")

Копируем сервисы и compose-файл в вм manager.

![alt text](prevs/5.png "ansi")

Установили ansible с помощью sudo apt install ansible.

![alt text](prevs/6.png "ansi2")
![alt text](prevs/7.png "ansi3")

Содаем папку ansible и inventory файл.

![alt text](prevs/8.png "ansi4")

Для node02 снова пришлось скопировать ключ vagrant с хоста на manager с помощью команды vagrant upload .vagrant/machines/node02/virtualbox/private_key /tmp/node02_key manager и перебросить на node02.

![alt text](prevs/9.png "ansi5")

Тестирование соединения менеджера с двумя узлами через ansible.

![alt text](prevs/10.png "ansi6")

Создание playbook файла.

![alt text](prevs/11.png "ansi7")

Перекидываем докерфайлы для сервисов из прошлого задания. Запускаем playbook командой ansible-playbook -i inventory deploy-app.yml

![alt text](prevs/12.png "tests")

Postman-тесты.

![alt text](prevs/13.png "roles")

Создаем новую структуру проекта для плэйбука с ролями.

![alt text](prevs/14.png "roles2")

Запуск плэйбука с ролями командой ansible-playbook -i inventory deploy-roles.yml

![alt text](prevs/15.png "roles3")

Запуск Apache через браузер.

![alt text](prevs/16.png "roles4")

Работа postgre на node02.

![alt text](prevs/17.png "roles5")

Работа сервисов на node01.

![alt text](prevs/18.png "roles6")

Postman-тесты для плэйбука с ролями. Так же были скопированы директории ansible на хост командой rsync -avz -e "ssh -i .vagrant/machines/manager/virtualbox/private_key -o StrictHostKeyChecking=no" vagrant@192.168.56.10:/home/vagrant/ansible/ src/ansible01/

### 2. Service Discovery

![alt text](prevs/19.png "consul")
![alt text](prevs/20.png "consul2")

Создаём папку consul01 и 2 конфигурационных файла, для сервера и клиента consul.
Далее создаем новый Vagrantfile для 4 машин: consul_server, api, manager, db.

![alt text](prevs/21.png "consul3")

Создаем структуру проекта и прописываем логику работы ролей.

![alt text](prevs/22.png "consul4")

Установил maven, и openjdk 11, чтобы скомпилировать jar-файл для hotel-service. Скомпилировал проект через mvn clean package -DskipTests, чтоб не падала компиляция из-за отсутствия тестов. Далее копируем jar в проект cp target/hotel-service-*.jar ../../ansible02/roles/install_hotels_service/files/hotel-service.jar

![alt text](prevs/23.png "consul5")

Копируем ssh-ключи и файлы на manager.

![alt text](prevs/24.png "consul6")

Настраиваем ключи на manager и переходим к развертыванию consul, сначала проверим соединение.
Запускаем плэйбук через ansible-playbook -i inventory deploy-consul.yml -v

![alt text](prevs/666.png "consu666")

Было множество ошибок, исправлений и перезапусков!
Внимание: из-за недоступоности сайта hashicorp в нашем регионе, я локально перемещал бинарник consul в проект и оттуда на vm. Чтоб не выгружать 100+мб на гитлаб, я бинарник удалил из репозитория!

![alt text](prevs/25.png "consul7")
![alt text](prevs/26.png "consul8")

Проверка в Consul UI сервисов и узлов.

![alt text](prevs/111.png "consul9")
![alt text](prevs/222.png "consul10")
![alt text](prevs/333.png "consul11")

Операции Create и Read.

Операции Update и Delete не работают в данном проекте, так как PATCH, PUT и DELETE операции не работают из-за несовместимости типов Integer/Long в Spring Data REST.
Однако, задача мб выполнена другим путём:

![alt text](prevs/444.png "consul12")
![alt text](prevs/555.png "consul13")

Update и Delete через подключение к бд!
