# Netology_HomeWork

## Задание №1

Скриншот Terraform:

![yaml](yaml.png)
________________________

Скриншот yaml:

![terraform](terraform.png)
________________________

Скриншот MarkDown:

![markdown](markdown.png)
________________________

Скриншот Bash:

![bash](bash.png)
________________________

Скриншот Jsonnet:

![jsonnet](jsonnet.png)
________________________



## Задание №2

Вводные:
Вам необходимо описать процесс решения задачи в соответствии с жизненным циклом разработки программного обеспечения. Использование какого-либо конкретного метода разработки не обязательно. Для решения главное - прописать по пунктам шаги решения задачи (релизации в конечный результат) с участием менеджера, разработчика (или команды разработчиков), тестировщика (или команды тестировщиков) и себя как DevOps-инженера.

Решение:
Руководитель проекта (далее - РП) совместно с бизнес-аналитиком производят декомпозицию требований Заказчика. Далее задача поступает в команду разработчиков (через тим-лида при глубокой декомпозиции). Далее разработчики после круга согласования трудозатрат через РП приступают к реализации разработки новой функциональности - это происходит в рамках спринта. Разработчик пишет код в своей среде разработки, потом подливает базовую ветку в ветку спринта и создает запрос на слияние (мерж-реквест). Тим-лид проводит код-ревью и "Утверждает". Далее задача попдает в QA на прохождение функциональных тестов. Далее QA пишет запрос на релиз (релиз-реквест) и ставит статус "Протестировано". Далее происходит оповещение DevOps-инженера о готовности к деплою. DevOps-иженер деплоит на стейдж (предпродуктив), где проверяется работоспособность релиза на окружении стейджа. Затем РП получает обратную связь от Заказчика, что Система работает и согласовывает с Заказчиком время накатки релиза на продакшн. Затем DevOps-Инженер деплоит на Продуктив, проводя при необходимости процедуры миграции (либо заранее готовит окружение актуальное на продуктиве).



## Модуль "Система контроля версий"

Благодаря файлу Terraform/.gitignore будут проигнорированы сущности, котороые условно можно
разделить на 3 группы:
1. Конкретные файлы (имена указаны без звёздочек, с расширением)
2. Набор файлов (указаны со свёздочкой либо в имени, либо в расширении)
3. Игнорирование директории /.terraform и файлов внутри неё, где бы она ни находились (т.к. указаны две звёздочки)


## Модуль "Основы Git"
Ссылки на три репозитория ниже.

1. https://github.com/Tiinamu/Netology_HomeWork/
2. https://gitlab.com/Tiinamu/netology_homework/
3. https://bitbucket.org/tiinamu/netology_homework/

## Домашнее задание к занятию «2.3. Ветвления в Git»

Ссылка на итоговый граф по результатам выполнения ДЗ:
https://github.com/Tiinamu/Netology_HomeWork/network



## Домашнее задание к занятию «3.1. Работа в терминале (лекция 1)» 

1. Установите средство виртуализации Oracle VirtualBox.

![3_1_1](pictures/3_1_1.png)
________________________
 
2. Установите средство автоматизации Hashicorp Vagrant.

![3_1_2](pictures/3_1_2.PNG)
________________________

3. Подготовьте удобный для дальнейшей работы терминал.

![3_1_3](pictures/3_1_3.PNG)
________________________

4. С помощью базового файла конфигурации запустите Ubuntu 20.04 в VirtualBox посредством Vagrant.

Выполнено.
________________________

5. Ознакомьтесь с графическим интерфейсом VirtualBox, посмотрите как выглядит виртуаль-ная машина, которую создал для вас Vagrant, какие аппаратные ресурсы ей выделены. Какие ресурсы выделены по-умолчанию?

![3_1_4](pictures/3_1_4.PNG)
________________________

6. Ознакомьтесь с возможностями конфигурации VirtualBox через Vagrantfile: документация. Как добавить оперативной памяти или ресурсов процессора виртуальной машине?
На выключенной машине произвести настройки:

![3_1_5](pictures/3_1_5.PNG)
________________________

7. Команда vagrant ssh из директории, в которой содержится Vagrantfile, позволит вам ока-заться внутри виртуальной машины без каких-либо дополнительных настроек. Попрактикуйтесь в выполнении обсуждаемых команд в терминале Ubuntu.

![3_1_6](pictures/3_1_6.PNG)
________________________

8. Ознакомиться с разделами man bash, почитать о настройках самого bash:
•	какой переменной можно задать длину журнала history, и на какой строчке manual это описывается?
•	что делает директива ignoreboth в bash?
Количество хранимых команд определяется двумя переменными: HISTSIZE и HISTFILESIZE. Первая определяет количество команд, хранимых в памяти, вторая — в файле. 

Посмотрим текущие значения:

![3_1_7](pictures/3_1_7.PNG)

Выставим новые значения:

![3_1_8](pictures/3_1_8.PNG)

Проверим изменения:

![3_1_9](pictures/3_1_9.PNG)

При выводе через man bash эти команды находятся здесь:

![3_1_10](pictures/3_1_10.PNG) 

У переменной HISTCONTROL есть несколько параметров, среди которых:
-	ignorespace - не сохранять команды начинающиеся с пробела, 
-	ignoredups - не сохранять команду, если такая уже имеется в истории
-	ignoreboth  - сокращение для ignorespace и ignoredups

9. В каких сценариях использования применимы скобки {} и на какой строчке man bash это описано?
Фигурные скобки являются RESERVED WORDS. Среди прочего есть такие зарезервированные слова:
! case  coproc  do done elif else esac fi for function if in select then until while { } time [[ ]]В 
При выводе через man bash эта информация находится здесь:

![3_1_11](pictures/3_1_11.PNG) 

________________________

10. С учётом ответа на предыдущий вопрос, как создать однократным вызовом touch 100000 файлов? Получится ли аналогичным образом создать 300000? Если нет, то почему?

Воспроизвести N-ое количество повторяющих действий можно с помощью зарезервированных символов {}, например, вот так:
touch {000001..100000}.md
________________________

11. В man bash поищите по /\[\[. Что делает конструкция [[ -d /tmp ]]
При поиске в man bash находим, что
-	 [[ выражение ]] Возвращает статус 0 или 1 в зависимости от вычисления выражения условного выражения.
-  ![3_1_12](pictures/3_1_12.PNG)

Т.о. конструкция [[ -d /tmp ]] возвращает 1, если директория tmp имеется и возвращает 0, если такового нет.
________________________


12. Основываясь на знаниях о просмотре текущих (например, PATH) и установке новых переменных, командах, которые мы рассматривали, добейтесь в выводе type -a bash в виртуальной машине наличия первым пунктом в списке:
bash is /tmp/new_path_directory/bash
bash is /usr/local/bin/bash
bash is /bin/bash
(прочие строки могут отличаться содержимым и порядком) В качестве ответа приведите команды, которые позволили вам добиться указанного вывода или соответствующие скриншо-ты.

Проверяем вывод команды type -a bash:

![3_1_13](pictures/3_1_13.PNG)

Создаем директорию в корне:

![3_1_14](pictures/3_1_14.PNG)

Копируем файл bash:

![3_1_15](pictures/3_1_15.PNG)

Проверяем, что есть в $PATH, видим, что не хватает пути /tmp/new_path_dir/ (1)
2. Добавляем /tmp/new_path_dir/ в $PATH (2)
3. Проверяем, что /tmp/new_path_dir/ добавился (3)
4. Проверяем вывод команды type -a bash, видим, что всё корректно и локация исполняемого файла добавилась (4)
![3_1_16](pictures/3_1_16.PNG)
________________________


13. Чем отличается планирование команд с помощью batch и at?

Команда at принимает дату и время ( runtime ), когда вы хотите выполнить задание, как параметр командной строки, и команду, которая должна быть выполнена из стандартного ввода.
Команда batch или его псевдоним at -b планирует задания и выполняет их в пакетной очереди, если позволяет уровень загрузки системы. По умолчанию задания выполняются, когда средняя загрузка системы ниже 1,5.
________________________

14. Завершите работу виртуальной машины чтобы не расходовать ресурсы компьютера и/или батарею ноутбука.

Виртуальная машина выключена:

![3_1_17](pictures/3_1_17.PNG)
________________________


## Домашнее задание к занятию «3.2. Работа в терминале (лекция 2)» 

1. Какого типа команда cd? Попробуйте объяснить, почему она именно такого типа; опишите ход своих мыслей, если считаете что она могла бы быть другого типа.

Данная команда является Встроенной командой оболочки:

![3_2_1](pictures/3_2_1.PNG)
В теории, можно было бы рассматривать еще такие типы, как Внешняя команда / исполняемый файл или Функция оболочки.  Если бы команда была внешней, то пришлось бы править $PATH. 
________________________

2.  Какая альтернатива без pipe команде grep <some_string> <some_file> | wc -l? man grep поможет в ответе на этот вопрос. Ознакомьтесь с документом о других подобных не-корректных вариантах использования pipe.

На примере анализа файла .bash_history. 
Через pipe:

![3_2_2](pictures/3_2_2.PNG)

Без pipe:

![3_2_3](pictures/3_2_3.PNG)
________________________

3.  Какой процесс с PID 1 является родителем для всех процессов в вашей виртуальной ма-шине Ubuntu 20.04?

На виртуальной машине родителем для всех процессов является systemd(1):

![3_2_4](pictures/3_2_4.PNG)
________________________

4.  Как будет выглядеть команда, которая перенаправит вывод stderr ls на другую сессию терминала?

Посмотрим выполнение команды на терминале pts2:
ls -lha “error view” 2>/dev/pts/1:

![3_2_5](pictures/3_2_5.PNG)

При этом на терминале pts1 отображается:

![3_2_6](pictures/3_2_6.PNG)
________________________

5. Получится ли одновременно передать команде файл на stdin и вывести ее stdout в другой файл? Приведите работающий пример.

На примере файлов rtest.md и rtest3.md: 

![3_2_7](pictures/3_2_7.PNG)
________________________

6. Получится ли находясь в графическом режиме, вывести данные из PTY в какой-либо из эмуляторов TTY? Сможете ли вы наблюдать выводимые данные?

В качестве эмулятора tty возьмем консоль ВМ, проверим вывод команды ps:

![3_2_8](pictures/3_2_8.PNG)

В качестве pty оставим текущий терминал, посмотрим вывод команды ps:

![3_2_9](pictures/3_2_9.PNG)

Направим сообщение Proverka pty->tty  с  pts/0 на tty2:

![3_2_10](pictures/3_2_10.PNG)

Результат – видим, что сообщение отобразилось на tty2:

![3_2_11](pictures/3_2_11.PNG)

![3_2_12](pictures/3_2_12.PNG)
________________________

7. Выполните команду bash 5>&1. К чему она приведет? Что будет, если вы выполните echo netology > /proc/$$/fd/5? Почему так происходит?

Командами bash 5>&1, bash 6>&1 можно создать новые дескрипторы, которые можно пронаблюдать здесь:

![3_2_13](pictures/3_2_13.PNG)

Дескрипторы 5,6 связаны с псевдотерминалом /dev/pts. Выполнение следующей команды выведет данные в файл дескриптор 5: 

![3_2_14](pictures/3_2_14.PNG)
________________________

8. Получится ли в качестве входного потока для pipe использовать только stderr команды, не потеряв при этом отображение stdout на pty? Напоминаем: по умолчанию через pipe пере-дается только stdout команды слева от | на stdin команды справа. Это можно сделать, поме-няв стандартные потоки местами через промежуточный новый дескриптор, который вы научились создавать в предыдущем вопросе.

Сделать можно через промежуточный дескриптор «7»:

![3_2_15](pictures/3_2_15.PNG)
________________________

9. Что выведет команда cat /proc/$$/environ? Как еще можно получить аналогичный по со-держанию вывод?

Команда выведет содержимое файла environ – переменные окружения для текущего сеанса в каталоге текущего процесса.
За исключением строки OLDPWD=/proc/4138/fd, вывод аналогичег при вызове команды env.
________________________

10. Используя man, опишите что доступно по адресам /proc/<PID>/cmdline, /proc/<PID>/exe.
 
/proc/<PID>/cmdline: этот файл, доступный только для чтения, содержит полную командную строку для процесса, если только процесс не является зомби: 
 
![3_2_16](pictures/3_2_16.PNG)
 
/proc/<PID>/exe: этот файл представляет собой символическую ссылку, содержащую фактический путь к выполняе-мой команде. Эта символическая ссылка может быть разыменована в обычном режиме; попытка открыть ее приве-дет к исполнению. Вы даже можете ввести /proc/[pid]/exe, чтобы запустить другую копию того же исполняемого файла, который запускается процессом [pid]. 
 
![3_2_17](pictures/3_2_17.PNG)
________________________
 
11. Узнайте, какую наиболее старшую версию набора инструкций SSE поддерживает ваш процессор с помощью /proc/cpuinfo.

Смотрим результат вывода команды sudo cat /proc/cpuinfo | grep sse – получаем ответ sse4_2:

![3_2_18](pictures/3_2_18.PNG)
________________________
 
12. При открытии нового окна терминала и vagrant ssh создается новая сессия и выделяется pty. Это можно подтвердить командой tty, которая упоминалась в лекции 3.2. Однако:
 
vagrant@netology1:~$ ssh localhost 'tty'	
not a tty 
Почитайте, почему так происходит, и как изменить поведение.

По команде man ssh | grep tty я нашел, что, т.к. SSH_TTY не установлен, то и не следует прописывать ‘tty’ в команде. 
 
![3_2_19](pictures/3_2_19.PNG)
 
Поэтому, чтобы устранить проблему с not a tty, требуется прописать:

![3_2_20](pictures/3_2_20.PNG)

Результат вывода команды следующий:
 
![3_2_21](pictures/3_2_21.PNG)
________________________

13. Бывает, что есть необходимость переместить запущенный процесс из одной сессии в другую. Попробуйте сделать это, воспользовавшись reptyr. Например, так можно перенести в screen процесс, который вы запустили по ошибке в обычной SSH-сессии.

Последовательность действий следующая:

•	Запустим длительный процесс, например, top, выведем его в фон CTRL-Z или &
•	Посмотрим номер джоба (running background jobs) через команду jobs
    [1]+ 18586 Stopped (signal) top
•	Возобновим процесс в фоне: bg %1
•	Запустим второй терминал через tmux
•	Перехватим процесс на новый tty: reptyr 18586

Примечание: Значение было выставлено в ноль: kernel.yama.ptrace_scope = 0
________________________
 
14. sudo echo string > /root/new_file не даст выполнить перенаправление под обычным пользователем, так как перенаправлением занимается процесс shell'а, который запущен без sudo под вашим пользователем. Для решения данной проблемы можно использовать конструкцию echo string | sudo tee /root/new_file. Узнайте что делает команда tee и почему в отличие от sudo echo команда с sudo tee будет работать.
 
Команда tee делает вывод одновременно и в файл, указаный в качестве параметра, и в stdout, в данном примере команда получает вывод из stdin, перенаправленный через pipe от stdout команды echo и так как команда запущена от sudo , соотвественно имеет права на запись в файл


## Домашнее задание к занятию «3.3. Операционные системы, лекция 1» 

1. Какой системный вызов делает команда cd? В прошлом ДЗ мы выяснили, что cd не является самостоятельной программой, это shell builtin, поэтому запустить strace непосредственно на cd не получится. Тем не менее, вы можете запустить strace на /bin/bash -c 'cd /tmp'. В этом случае вы увидите полный список системных вызовов, которые делает сам bash при старте. Вам нужно найти тот единственный, который относится именно к cd. Обратите внимание, что strace выдаёт результат своей работы в поток stderr, а не в stdout.

Сначала системный вызов execve выполняет программу, которая передается ему в параметрах (в данном случае это cd ):  
 
execve("/bin/bash", ["/bin/bash", "-c", "cd /tmp"], 0x7ffd468534e0 /* 23 vars */) = 0

Затем в системный вызов stat передается параметр tmp:
 
stat("/tmp", {st_mode=S_IFDIR|S_ISVTX|0777, st_size=4096, ...}) = 0

Затем системный вызов меняет каталог, выполняя ожидаемое действие команды:
 
chdir("/tmp")                           = 0
________________________

2. Попробуйте использовать команду file на объекты разных типов на файловой системе. Например:
vagrant@netology1:~$ file /dev/tty
/dev/tty: character special (5/0)

vagrant@netology1:~$ file /dev/sda
/dev/sda: block special (8/0)

vagrant@netology1:~$ file /bin/bash
/bin/bash: ELF 64-bit LSB shared object, x86-64

Используя strace выясните, где находится база данных file на основании которой она делает свои догадки.
 
С помощью команды strace file /dev/sda 2>&1 | grep open  вычислим все строки с попаданием “open”, т.к. подразумеваем, что базу данных надо найти и открыть:
 
![3_3_1](pictures/3_3_1.JPG)
 
Далее пробежимся командой cat по всем файлам и проверим совпадения по выводу character special, block special, LSB shared object:
cat /lib/x86_64-linux-gnu/libmagic.so.1 | grep -a "block special"
cat /usr/share/misc/magic.mgc | grep -a "LSB"

Файлов, удовлетворяющих условию – два – /lib/x86_64-linux-gnu/libmagic.so.1 и usr/share/misc/magic.mgc. 
________________________
 
3. Предположим, приложение пишет лог в текстовый файл. Этот файл оказался удален (deleted в lsof), однако возможности сигналом сказать приложению переоткрыть файлы или просто перезапустить приложение – нет. Так как приложение продолжает писать в удаленный файл, место на диске постепенно заканчивается. Основываясь на знаниях о перенаправ-лении потоков предложите способ обнуления открытого удаленного файла (чтобы освободить место на файловой системе).
 
Запустим команду echo в бесконечном цикле с предусловием:
 
![3_3_2](pictures/3_3_2.JPG)
 
Далее проверим в lsof наличие процесса с выполнением этой команды и удалим файл tt, куда производится запись. При этом при следующем запуске lsof появится пометка (deleted), но сам файл продолжит расти.
 
![3_3_3](pictures/3_3_3.JPG)
 
Перенаправим поток команды (на скрине выше видим, что это третий файл дескриптор) в никуда:
Можно было бы в него скопировать пустоту, но это временная мера:
cp /dev/null /proc/18586/fd/3  
т.к. файл растет онлайн, направим поток STDOUT с него в никуда:
~$ cat /proc/18586/fd/3  >/dev/null
________________________
 
4. Занимают ли зомби-процессы какие-то ресурсы в ОС (CPU, RAM, IO)?
 
Создадим файл с кодом С:
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <errno.h>
 
int main ()
{
  pid_t child_pid;
  int child_status;
 
  child_pid = fork ();
  if (child_pid > 0) {
    // parent process will sleep for 30 seconds and exit, without a call to wait()
    fprintf(stderr,"parent process - %d\n", getpid());    
    sleep(30); 
    exit(0);
  }
  else if (child_pid == 0) {
    // child process will exit immediately
    fprintf(stderr,"child process - %d\n", getpid());
    exit(0);    
  }
  else if (child_pid == -1) {
    // fork() error
    perror("fork() call failed");    
    exit (-1);
  }
  else {
    // this should not happen
    fprintf(stderr, "unknown return value of %d from fork() call", child_pid);
    exit (-2);
  }
  return 0;
}

Сохраняем файл под именем zombie.c, компилируем с помощью gcc:

![3_3_4](pictures/3_3_4.JPG)
 
Запускаем, видим результат:

![3_3_5](pictures/3_3_5.JPG)
 
Проверяем – видим, что потребления ресурсов нет:

![3_3_6](pictures/3_3_6.JPG)
 
________________________
 
5. В iovisor BCC есть утилита opensnoop:

root@vagrant:~# dpkg -L bpfcc-tools | grep sbin/opensnoop
/usr/sbin/opensnoop-bpfcc

На какие файлы вы увидели вызовы группы open за первую секунду работы утилиты? Вос-пользуйтесь пакетом bpfcc-tools для Ubuntu 20.04. Дополнительные сведения по установке.

![3_3_7](pictures/3_3_7.JPG)
 
________________________
 
6. Какой системный вызов использует uname -a? Приведите цитату из man по этому системному вызову, где описывается альтернативное местоположение в /proc, где можно узнать версию ядра и релиз ОС.
 
Через man 2 uname находим:
 
![3_3_8](pictures/3_3_8.JPG)
 
________________________
 
7. Чем отличается последовательность команд через ; и через && в bash? Например:
 
~# test -d /tmp/some_dir; echo Hi

Hi

~# test -d /tmp/some_dir && echo Hi

~#
 
Есть ли смысл использовать в bash &&, если применить set -e?

 
Последовательность команд через && - команды соединены условным оператором И
Последовательность команд через ; - команды соединены разделителем команд

Оператор ; выполняет несколько команд одновременно последовательно и обеспечивает вывод без зависимости от успеха и отказа других команд, в отличие от &&, где вторая команда выполняется только после успешной первой команды.
Set -e - прерывает сессию при любом ненулевом значении исполняемых команд кроме последней.

Применять &&  вместе с set -e- не имеет смысла.
 
________________________

8. Из каких опций состоит режим bash set -euxo pipefail и почему его хорошо было бы использовать в сценариях?
 
![3_3_9](pictures/3_3_9.JPG)

-e  Exit immediately if a command exits with a non-zero status.
 
-u  Treat unset variables as an error when substituting.
 
-x  Print commands and their arguments as they are executed.
 
-o option-name
 
          Set the variable corresponding to option-name:
              allexport    same as -a
              braceexpand  same as -B
              emacs        use an emacs-style line editing interface
              errexit      same as -e
              errtrace     same as -E
              functrace    same as -T
              hashall      same as -h
              histexpand   same as -H
              history      enable command history
              ignoreeof    the shell will not exit upon reading EOF
              interactive-comments
                           allow comments to appear in interactive commands
              keyword      same as -k
              monitor      same as -m
              noclobber    same as -C
              noexec       same as -n
              noglob       same as -f
              nolog        currently accepted but ignored
              notify       same as -b
 ________________________
 
 9. Используя -o stat для ps, определите, какой наиболее часто встречающийся статус у про-цессов в системе. В man ps ознакомьтесь (/PROCESS STATE CODES) что значат дополнитель-ные к основной заглавной буквы статуса процессов. Его можно не учитывать при расчете (считать S, Ss или Ssl равнозначными).
 
Выгрузим все значения stat в файл:

![3_3_10](pictures/3_3_10.JPG)

Выполним операцию wc для всех видов stat:
 
![3_3_11](pictures/3_3_11.JPG)
 
Получим:
S – 57 
I – 45 
Ss – 20 
Ssl – 7
Затем идут Rm R+, Z и др.

Т.о. самыми частыми являются процессы, ожидающие завершения (S) и бездействующие (I).

![3_3_12](pictures/3_3_12.JPG)
 
Затем идут Rm R+, Z и др.

Т.о. самыми частыми являются процессы, ожидающие завершения (S) и бездействующие (I).

 ________________________

 
 ## Домашнее задание к занятию «3.4. Операционные системы, лекция 2» 

1.	На лекции мы познакомились с node_exporter. В демонстрации его исполняемый файл запускался в background. Этого достаточно для демо, но не для настоящей production-системы, где процессы должны находиться под внешним управлением. Используя знания из лекции по systemd, создайте самостоятельно простой unit-файл для node_exporter:
o	поместите его в автозагрузку,
o	предусмотрите возможность добавления опций к запускаемому процессу через внешний файл (посмотрите, например, на systemctl cat cron),
o	удостоверьтесь, что с помощью systemctl процесс корректно стартует, завершается, а после перезагрузки автоматически поднимается.

Скачиваем node_exporter в домашнюю папку: 
wget  https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz
Распаковываем в домашнюю папку:
tar -xzvf node_exporter-1.3.1.linux-amd64.tar.gz

Подготавливаем Unit-файл, размещаем его в директории /etc/systemd/system. Заполняем основные разделы – Unit, Ser-vice, Install:
[Unit]
Description=MONITORING LINUX HOST METRICS WITH THE NODE EXPORTER
Documentation=https://github.com/prometheus/node_exporter/blob/master/README.md
[Service]
EnvironmentFile=-/etc/default/node_exporter
ExecStart=/bin/bash -c /home/vagrant/node_exporter-1.3.1.linux-amd64/node_exporter
[Install]
WantedBy=multi-user.target

![3_4_1](pictures/3_4_1.JPG)
 
Последовательно производим:
vagrant@vagrant:/etc/systemd/system$ sudo systemctl daemon-reload (перезапуск демона сервисов), 
vagrant@vagrant:/etc/systemd/system$ sudo systemctl start node_exporter (Старт сервиса)
vagrant@vagrant:/etc/systemd/system$ sudo systemctl enable node_exporter (Добавление сервиса в автозагрузку)

Далее проверяем статус сервиса:
vagrant@vagrant:/etc/systemd/system$ sudo systemctl status node_exporter


Видим, что сервис запустился:

![3_4_2](pictures/3_4_2.JPG)
 
curl -s localhost:9100/metrics 2>/dev/null | grep node_filesystem_avail_bytes | grep mapper
 
![3_4_3](pictures/3_4_3.JPG)
 
________________________
 
2. Ознакомьтесь с опциями node_exporter и выводом /metrics по умолчанию. Приведите несколько опций, которые вы бы выбрали для базового мониторинга хоста по CPU, памяти, диску и сети.

По CPU:

Среди прочих полезных метрик:

node_cpu_seconds_total:

![3_4_4](pictures/3_4_4.JPG)
 
По ОЗУ:
 
Среди прочих полезных метрик:

process_virtual_memory_max_bytes
node_memory_MemTotal_bytes.
node_memory_MemFree_bytes.
node_memory_Cached_bytes.
node_memory_Buffers_bytes.

process_virtual_memory_max_bytes (Максимальный объем доступной виртуальной памяти в байтах)

![3_4_5](pictures/3_4_5.JPG)
 
Диск:
 
Среди прочих полезных метрик:

node_disk_info
node_disk_info
node_filesystem_size_bytes.
node_filesystem_avail_bytes.
node_filesystem_free_bytes.
node_disk_read_bytes_total.
node_disk_written_bytes_total.

node_disk_info (информаций по количеству разделов)

![3_4_6](pictures/3_4_6.JPG)
 
node_disk_discard_time_seconds_total  (общее количество секунд, затраченных на все отбрасывания)
 
![3_4_7](pictures/3_4_7.JPG)
 

Сеть:
 
Среди прочих полезных метрик:
 
node_network_up
node_network_receive_drop_total
node_network_receive_errs_total
node_network_receive_bytes_total
node_network_transmit_bytes_total

node_network_up  (поднятые интерфейсы):

![3_4_8](pictures/3_4_8.JPG)
 
________________________
 
3. Установите в свою виртуальную машину Netdata. Воспользуйтесь готовыми пакетами для установки (sudo apt install -y netdata). После успешной установки:
o	в конфигурационном файле /etc/netdata/netdata.conf в секции [web] замените значение с localhost на bind to = 0.0.0.0,
o	добавьте в Vagrantfile проброс порта Netdata на свой локальный компьютер и сделайте vagrant reload:
config.vm.network "forwarded_port", guest: 19999, host: 19999
После успешной перезагрузки в браузере на своем ПК (не в виртуальной машине) вы должны суметь зайти на localhost:19999. Ознакомьтесь с метриками, которые по умолчанию собираются Netdata и с комментариями, которые даны к этим метрикам.

- Устанавливаем Netdata

-- sudo apt install -y netdata:
 
![3_4_9](pictures/3_4_9.JPG)
 
-- правим конфигурационный файл /etc/netdata/netdata.conf – добавляем секцию [web]:
 
![3_4_10](pictures/3_4_10.JPG)
 
![3_4_11](pictures/3_4_11.JPG)
 
- Правим Vagrantfile:

-- установка загрузчика Chocolatey для того, чтобы в дальнейшем установить с помощью него nano для Powershell:

PS C:\Users\Банцерев Артем> set-executionpolicy bypass -scope process -force; iex ((new-object sys-tem.net.webclient).downloadstring('https://chocolatey.org/install.ps1'))
 
![3_4_12](pictures/3_4_12.JPG)

-- установка nano для Powershell:

PS C:\Users\Банцерев Артем> choco install nano:

![3_4_13](pictures/3_4_13.JPG)

-- правим Vagrantfile, добавляя строку 
config.vm.network "forwarded_port", guest: 19999, host: 19999

![3_4_14](pictures/3_4_14.JPG)
 
-- делаем vagrant reload:

![3_4_15](pictures/3_4_15.JPG)

-- теперь с хостовой машины доступна страница http://localhost:19999/:

![3_4_16](pictures/3_4_16.JPG)
 
________________________
 
4. Можно ли по выводу dmesg понять, осознает ли ОС, что загружена не на настоящем обору-довании, а на системе виртуализации?

Да, в выводе команды присутствует информация о системе виртуализации:

![3_4_17](pictures/3_4_17.JPG)
 
________________________
 
5. Как настроен sysctl fs.nr_open на системе по-умолчанию? Узнайте, что означает этот пара-метр. Какой другой существующий лимит не позволит достичь такого числа (ulimit --help)?

![3_4_18](pictures/3_4_18.JPG)
 
fs.nr_open  - это максимальное число открытых дескрипторов для системы. 

Смотрим Help:

![3_4_19](pictures/3_4_19.JPG)
 
Максимальное количество открытых дескрипторов для жесткого и мягкого лимита ниже:
 
![3_4_20](pictures/3_4_20.JPG)
 
________________________
 
6. Запустите любой долгоживущий процесс (не ls, который отработает мгновенно, а, напри-мер, sleep 1h) в отдельном неймспейсе процессов; покажите, что ваш процесс работает под PID 1 через nsenter. Для простоты работайте в данном задании под root (sudo -i). Под обычным пользователем требуются дополнительные опции (--map-root-user) и т.д.

Заходим под рутом, запускаем sleep 1h через unshare, смотрим вывод ps (PID = 1652)

![3_4_21](pictures/3_4_21.JPG)
 
Заходим в неймспейс, убеждаемся, что PID = 1:

![3_4_22](pictures/3_4_22.JPG)
 
________________________
 
7. Найдите информацию о том, что такое :(){ :|:& };:. Запустите эту команду в своей виртуальной машине Vagrant с Ubuntu 20.04 (это важно, поведение в других ОС не проверялось). Некоторое время все будет "плохо", после чего (минуты) – ОС должна стабилизироваться. Вы-зов dmesg расскажет, какой механизм помог автоматической стабилизации. Как настроен этот механизм по-умолчанию, и как изменить число процессов, которое можно создать в сессии?

После ввода :(){ :|:& };: видим:

![3_4_23](pictures/3_4_23.JPG)
 
Что сопровождается загрузкой в 100% CPU:

![3_4_24](pictures/3_4_24.JPG)
 
По выводу dmesg видим, что процесс прекращается с помощью механизма fork rejected:
 
![3_4_25](pictures/3_4_25.JPG)
 
Выход из зацикливания произошел при превышении параметров по умолчанию, которые моно посмотреть с помощью ulimit -a:
 
![3_4_26](pictures/3_4_26.JPG)
 
Регулируя эти лимиты, можно выйти из зацикливания по другим критериям. Число процессов, которые можно создать в сессии, выставляется с помощью ulimit -u.  Так, для 100 процессов надо выставить ulimit -u 100:
 
![3_4_27](pictures/3_4_27.JPG)
________________________
 
  ## Домашнее задание к занятию «3.5. Файловые системы»
 
 1.  Узнайте о sparse (разряженных) файлах.
 
Разреженные – это специальные файлы, которые с бОльшей эффективностью используют файловую систему, они не позволяют ФС занимать свободное дисковое пространство носителя, когда разделы не заполнены. То есть, «пустое ме-сто» будет задействовано только при необходимости. Пустая информация в виде нулей, будет хранится в блоке метадан-ных ФС. Поэтому, разреженные файлы изначально занимают меньший объем носителя, чем их реальный объем. 
(Sparse файл это файл, в котором куски, содержащие нули, на диск не пишутся. )
Для использования sparse-файлов нужно указать ключ --sparse
       --sparse = always - для создания разреженного файла DEST всякий раз, когда файл SOURCE содержит достаточно длин-ную последовательность нулевых байтов. 
       --sparse = never   для запрета создания разреженных файлов. 
________________________
 
2.  Могут ли файлы, являющиеся жесткой ссылкой на один объект, иметь разные права доступа и владельца? Почему?
 
Жесткая ссылка – тот же самый файл, с теми же атрибутами, что и оригинальный файл.
Права доступа будут одинаковыми. 

Проверка:
Создадим файл test_link и жесткую ссылку test_link_hard:

![3_5_1](pictures/3_5_1.JPG)
 
Посмотрим права:
 
![3_5_2](pictures/3_5_2.JPG)
 
Изменим права для test_link c 0664 на 0665 и посмотрим итоговые права в оригинальном файле и жесткой ссылке:
 
![3_5_3](pictures/3_5_3.JPG)

Как видим, права поменялись на 0665 и там, и там.
________________________
 
3.  Сделайте vagrant destroy на имеющийся инстанс Ubuntu. Замените содержимое Vagrantfile следующим:
    Vagrant.configure("2") do |config|
      config.vm.box = "bento/ubuntu-20.04"
      config.vm.provider :virtualbox do |vb|
        lvm_experiments_disk0_path = "/tmp/lvm_experiments_disk0.vmdk"
        lvm_experiments_disk1_path = "/tmp/lvm_experiments_disk1.vmdk"
        vb.customize ['createmedium', '--filename', lvm_experiments_disk0_path, '--size', 2560]
        vb.customize ['createmedium', '--filename', lvm_experiments_disk1_path, '--size', 2560]
        vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', lvm_experiments_disk0_path]
        vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', lvm_experiments_disk1_path]
      end
    end
Данная конфигурация создаст новую виртуальную машину с двумя дополнительными неразмеченными дисками по 2.5 Гб.
После создания новой виртуальной машины видим, что появилось два неразмеченных дисками по 2,5 ГБ.

![3_5_4](pictures/3_5_4.JPG)
________________________
 
4.  Используя fdisk, разбейте первый диск на 2 раздела: 2 Гб, оставшееся пространство.
Используя утилиту fdisk, произведем разметку диска “b” в интерактивном режиме:

В интерактивном режиме имеются команды ниже:

a - включение или выключения флага boot для раздела;
d - удалить раздел;
F - показать свободное место;
l - вывести список известных типов разделов;
n - создать новый раздел;
p - вывести таблицу разделов;
t - изменение типа раздела;
i - вывести информацию о разделе;
I и O - записать или загрузить разметку в файл сценария sfdisk;
w - записать новую таблицу разделов на диск;
q - выйти без сохранения;
g - создать пустую таблицу разделов GPT;
o - создать пустую таблицу разделов MBR.

Будем использовать n и w

![3_5_5](pictures/3_5_5.JPG)

Проверяем разметку:

![3_5_6](pictures/3_5_6.JPG)
________________________
 
5.  Используя sfdisk, перенесите данную таблицу разделов на второй диск.
 
Скопируем таблицу разделов через опцию dump в файл sda.txt, а затем выгрузим её в /dev/sdc:

![3_5_7](pictures/3_5_7.JPG)
 
Проверим разделы на sdc:
 
![3_5_8](pictures/3_5_8.JPG)
 
После выключения ВМ, надо поменять VagrantFile на прежний.
________________________
 
6.  Соберите mdadm RAID1 на паре разделов 2 Гб.
 
Создаём RAID1 с помощью команды mdadm --create --verbose /dev/md1 -l 1 -n 2 /dev/sd{b1,c1}:

![3_5_9](pictures/3_5_9.JPG)
________________________
 
7.  Соберите mdadm RAID0 на второй паре маленьких разделов.
 
Создаём RAID0 с помощью команды mdadm --create --verbose /dev/md2 -l 0 -n 2 /dev/sd{b2,c2}:

![3_5_10](pictures/3_5_10.JPG)
 
Проверим, что получилось:
 
![3_5_11](pictures/3_5_11.JPG)

Также информацию обо всех созданных в системе RAID массивах можно в файле /proc/mdstat:

![3_5_12](pictures/3_5_12.JPG)
________________________
 
8. Создайте 2 независимых PV на получившихся md-устройствах.

Проверим физические тома LVM с помощью команды pvscan:
 
![3_5_13](pictures/3_5_13.JPG)

Инициализируем  тома для работы LVM с помощью команды pvcreate /dev/md1 /dev/md2:
 
![3_5_14](pictures/3_5_14.JPG)
 
Проверим физические тома LVM с помощью команды pvscan:
 
![3_5_15](pictures/3_5_15.JPG)
________________________
 
9.  Создайте общую volume-group на этих двух PV.

Группа томов - это не что иное, как пул памяти, который будет распределен между логическими томами и может состо-ять из нескольких физических разделов. После того как физические разделы инициализированы, можно создать из них группу томов (Volume Group, VG).
vgcreate  volume_group_common1 /dev/md1 /dev/md2
 
![3_5_16](pictures/3_5_16.JPG)
 
Проверим:
 
![3_5_17](pictures/3_5_17.JPG)
 
![3_5_18](pictures/3_5_18.JPG)
________________________
 
10.  Создайте LV размером 100 Мб, указав его расположение на PV с RAID0.
 
lvcreate -L 100M -n logical_volume1 volume_group_common1 /dev/md2

![3_5_19](pictures/3_5_19.JPG)
 
Проверяем:
 
![3_5_20](pictures/3_5_20.JPG)
 
![3_5_21](pictures/3_5_21.JPG)
________________________

11.  Создайте mkfs.ext4 ФС на получившемся LV.
 
mkfs.ext4 /dev/ volume_group_common1/ logical_volume1
 
![3_5_22](pictures/3_5_22.JPG)

Проверим на текущий момент  список примонтированных разделов, свободное место на них, а также узнать файловую систему Linux:
 
![3_5_23](pictures/3_5_23.JPG)
________________________
 
12.  Смонтируйте этот раздел в любую директорию, например, /tmp/new.

Создаем папку и монтируем раздел в директорию for_logical_volume1:

![3_5_24](pictures/3_5_24.JPG)
 
Проверяем  список примонтированных разделов, свободное место на них, а также узнать файловую систему Linux:
 
![3_5_25](pictures/3_5_25.JPG)
________________________
 
13.  Поместите туда тестовый файл, например wget https://mirror.yandex.ru/ubuntu/ls-lR.gz -O /tmp/new/test.gz.
 
![3_5_26](pictures/3_5_26.JPG)
________________________
 
14.  Прикрепите вывод lsblk.
 
Проверяем до pvmove: 
 
![3_5_27](pictures/3_5_27.JPG)
________________________
 
15. Протестируйте целостность файла:
root@vagrant:~# gzip -t /tmp/new/test.gz
root@vagrant:~# echo $?
0

![3_5_28](pictures/3_5_28.JPG)
________________________
 
16.  Используя pvmove, переместите содержимое PV с RAID0 на RAID1.

pvmove -n /dev/ volume_group_common1/logical_volume1 /dev/md2 /dev/md1
 
![3_5_29](pictures/3_5_29.JPG)
 
Проверяем после pvmove: 
 
![3_5_30](pictures/3_5_30.JPG)
________________________

17.  Сделайте --fail на устройство в вашем RAID1 md.

С помощью команды mdadm /dev/md1 --fail /dev/sdb1:

![3_5_31](pictures/3_5_31.JPG)
________________________
 
18.  Подтвердите выводом dmesg, что RAID1 работает в деградированном состоянии.

Вывод команды dmesg:
 
![3_5_32](pictures/3_5_32.JPG)
________________________

19.  Протестируйте целостность файла, несмотря на "сбойный" диск он должен продолжать быть доступен:

root@vagrant:~# gzip -t /tmp/new/test.gz
root@vagrant:~# echo $?
0

Проверка целостности файла – файл доступен, RAID отработал:

![3_5_33](pictures/3_5_33.JPG)
________________________
 
20.  Погасите тестовый хост, vagrant destroy.

Vagrant destroy
________________________

    Vagrant.configure("2") do |config|
      config.vm.box = "bento/ubuntu-20.04"
      config.vm.provider :virtualbox do |vb|
        lvm_experiments_disk0_path = "/tmp/lvm_experiments_disk0.vmdk"
        lvm_experiments_disk1_path = "/tmp/lvm_experiments_disk1.vmdk"
        vb.customize ['createmedium', '--filename', lvm_experiments_disk0_path, '--size', 2560]
        vb.customize ['createmedium', '--filename', lvm_experiments_disk1_path, '--size', 2560]
        vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', lvm_experiments_disk0_path]
        vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', lvm_experiments_disk1_path]
      end
    end


 
