﻿#Использовать "../.."
#Использовать asserts
#Использовать tempfiles
#Использовать fs

// Реализация шагов BDD-фич/сценариев c помощью фреймворка https://github.com/artbear/1bdd

Перем БДД; //контекст фреймворка 1bdd

// Метод выдает список шагов, реализованных в данном файле-шагов
Функция ПолучитьСписокШагов(КонтекстФреймворкаBDD) Экспорт
	БДД = КонтекстФреймворкаBDD;

	ВсеШаги = Новый Массив;

	ВсеШаги.Добавить("ЯДобавляюПользователяСПаролемИПравом");
	ВсеШаги.Добавить("ЯВыполняюОшибочнуюПопыткуЗахватОбъектовВХранилищеКонфигурацииПоФайлуСпискаОбъектов");
	ВсеШаги.Добавить("ЯКопируюПользователейИзХранилищаСПользователейИПаролем");
	ВсеШаги.Добавить("ЯВыполняюПопыткуПодключенияБазыКХранилищуСПараметромЗаменыКонфигурации");

	Возврат ВсеШаги;
КонецФункции

// Реализация шагов

// Процедура выполняется перед запуском каждого сценария
Процедура ПередЗапускомСценария(Знач Узел) Экспорт

КонецПроцедуры

// Процедура выполняется после завершения каждого сценария
Процедура ПослеЗапускаСценария(Знач Узел) Экспорт
    //ВременныеФайлы.Удалить();
КонецПроцедуры

//Я добавляю пользователя "Тест_1" с паролем "Пароль1" и правом "ТолькоЧтение"
Процедура ЯДобавляюПользователяСПаролемИПравом(Знач Пользователь, Знач Пароль, Знач Право) Экспорт
    ХранилищеКонфигурации = БДД.ПолучитьИзКонтекста("ХранилищеКонфигурации");
    ПравоХранилища = ХранилищеКонфигурации.ПраваПользователяХранилища()[Право];
    ХранилищеКонфигурации.ДобавитьПользователяВХранилище(Пользователь, Пароль, ПравоХранилища);
КонецПроцедуры

//Я выполняю ошибочную попытку захват объектов в хранилище конфигурации по файлу списка объектов
Процедура ЯВыполняюОшибочнуюПопыткуЗахватОбъектовВХранилищеКонфигурацииПоФайлуСпискаОбъектов() Экспорт
    ХранилищеКонфигурации = БДД.ПолучитьИзКонтекста("ХранилищеКонфигурации");
    ФайлСпискаОбъектов = БДД.ПолучитьИзКонтекста("ФайлСпискаОбъектов");

    Попытка
        ХранилищеКонфигурации.ЗахватитьОбъектыВХранилище(ФайлСпискаОбъектов);
    Исключение
    КонецПопытки;

КонецПроцедуры

//Я копирую пользователей из хранилища "КаталогХранилищаКонфигурации" с пользователей "Администратор" и паролем ""
Процедура ЯКопируюПользователейИзХранилищаСПользователейИПаролем(Знач КаталогХранилищаКонфигурации, Знач Пользователь, Знач Пароль) Экспорт

    ХранилищеКонфигурации = БДД.ПолучитьИзКонтекста("ХранилищеКонфигурации");
    ХранилищеКонфигурации.КопироватьПользователейИзХранилища(БДД.ПолучитьИзКонтекста("КаталогХранилищаКонфигурации"), Пользователь, Пароль);

КонецПроцедуры

//Я выполняю попытку подключения базы к хранилищу с параметром замены конфигурации "Истина"
Процедура ЯВыполняюПопыткуПодключенияБазыКхранилищуСПараметромЗаменыКонфигурации(Знач ПодключитьсяКхранилищу) Экспорт

    ХранилищеКонфигурации = БДД.ПолучитьИзКонтекста("ХранилищеКонфигурации");

    Попытка
        ХранилищеКонфигурации.ПодключитьсяКХранилищу(Истина, ПодключитьсяКхранилищу);
    Исключение
    КонецПопытки;

КонецПроцедуры
