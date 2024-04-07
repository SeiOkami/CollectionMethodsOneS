
#Область СлужебныйПрограммныйИнтерфейс

// Регистрация тестов
Процедура ИсполняемыеСценарии() Экспорт

	Перем ЮТТесты;
	ЮТТесты = ЖЧТ_Движок.ЮТТесты();
	
	ЮТТесты
		.ДобавитьТестовыйНабор("СвернутьТабличнуюЧасть")
			.ДобавитьТест("Тест_СвернутьТабличнуюЧасть_БезРесурсов")
			.ДобавитьТест("Тест_СвернутьТабличнуюЧасть_ОдинРесурс")
			.ДобавитьТест("Тест_СвернутьТабличнуюЧасть_НесколькоРесурсов")
			.ДобавитьТест("Тест_СвернутьТабличнуюЧасть_БезИзмерений")
		.ДобавитьТестовыйНабор("ТаблицаЗначенийБезNull")
			.ДобавитьТест("Тест_ТаблицаЗначенийБезNull")
		.ДобавитьТестовыйНабор("ОбновленнаяКолонкаТаблицы")
			.ДобавитьТест("Тест_ОбновленнаяКолонкаТаблицы_Создание")
			.ДобавитьТест("Тест_ОбновленнаяКолонкаТаблицы_Обновление")
			.ДобавитьТест("Тест_ОбновленнаяКолонкаТаблицы_ОбновлениеКромеТипа")
		.ДобавитьТестовыйНабор("ТаблицаЗначенийСПлохойКолонкой")
			.ДобавитьТест("Тест_ТаблицаЗначенийСПлохойКолонкой", 
				"Создание новой таблицы с плохой колонкой").СПараметрами(Истина)
			.ДобавитьТест("Тест_ТаблицаЗначенийСПлохойКолонкой", 
				"Дополнение существующей таблицы значений плохой колонкой").СПараметрами(Ложь)
		.ДобавитьТестовыйНабор("ПустыеКолонкиТаблицыЗначений")
			.ДобавитьТест("Тест_ПустыеКолонкиТаблицыЗначений_ПустаяТаблицаБезКолонок", "Пустая ТЗ без колонок")
			.ДобавитьТест("Тест_ПустыеКолонкиТаблицыЗначений_БезКолонокИЕстьСтроки", "Без колонок и есть строки")
			.ДобавитьТест("Тест_ПустыеКолонкиТаблицыЗначений_ПустаяТаблицаСКолонками", "Пустая ТЗ с колонками")
			.ДобавитьТест("Тест_ПустыеКолонкиТаблицыЗначений_ТаблицаСКолонкамиИСПустымиСтроками", "ТЗ с колонками и с пустыми строками")
			.ДобавитьТест("Тест_ПустыеКолонкиТаблицыЗначений_ТаблицаСоСтрокамиИБезПустыхКолонок", "ТЗ со строками и без пустых колонок")
			.ДобавитьТест("Тест_ПустыеКолонкиТаблицыЗначений_ТаблицаСоСтрокамиИСПустойКолонкой", "ТЗ со строками и пустой колонкой")
			.ДобавитьТест("Тест_ПустыеКолонкиТаблицыЗначений_ТаблицаСоСтрокамиИСПочтиПустойКолонкой", "ТЗ со строками и почти пустой колонкой")
		.ДобавитьТестовыйНабор("ЗаполнитьТаблицуЗначенийИзСтроки")
			.ДобавитьТест("Тест_ЗаполнитьТаблицуЗначенийИзСтроки")
		.ДобавитьТестовыйНабор("ВыгрузитьКолонку")
			.ДобавитьТест("Тест_ВыгрузитьКолонку")
		.ДобавитьТестовыйНабор("ИменаКолонокТаблицы")
			.ДобавитьТест("Тест_ИменаКолонокТаблицы")
				.СПараметрами("Колонка1")
				.СПараметрами("Колонка1,Колонка2,Колонка3")
				.СПараметрами("")
	;

КонецПроцедуры

#Область Тесты

#Область СвернутьТабличнуюЧасть

Процедура Тест_СвернутьТабличнуюЧасть_БезРесурсов() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Эталон = Обработки.ЖЧТ_ОбработкаТестирования.Создать().СвернутьТабличнуюЧасть_БезРесурсов;
	Эталон.Добавить();
	
	Параметр = Обработки.ЖЧТ_ОбработкаТестирования.Создать().СвернутьТабличнуюЧасть_БезРесурсов;
	Параметр.Добавить();
	Параметр.Добавить();
	Параметр.Добавить();
	
	ТестируемыйМодуль.СвернутьТабличнуюЧасть(Параметр);
	
	ЮТест.ОжидаетЧто(Параметр.Выгрузить()).Равно(Эталон.Выгрузить());
	
КонецПроцедуры

Процедура Тест_СвернутьТабличнуюЧасть_ОдинРесурс() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Эталон = Обработки.ЖЧТ_ОбработкаТестирования.Создать().СвернутьТабличнуюЧасть_ОдинРесурс;
	
	Строка = Эталон.Добавить();
	Строка.Измерение1 = 1;
	Строка.Ресурс1 = 3;
	
	Строка = Эталон.Добавить();
	Строка.Измерение2 = 1;
	Строка.Ресурс1 = 1;
	
	Параметр = Обработки.ЖЧТ_ОбработкаТестирования.Создать().СвернутьТабличнуюЧасть_ОдинРесурс;
	
	Строка = Параметр.Добавить();
	Строка.Измерение1 = 1;
	Строка.Ресурс1 = 1;
	
	Строка = Параметр.Добавить();
	Строка.Измерение2 = 1;
	Строка.Ресурс1 = 1;
	
	Строка = Параметр.Добавить();
	Строка.Измерение1 = 1;
	Строка.Ресурс1 = 2;
	
	ТестируемыйМодуль.СвернутьТабличнуюЧасть(Параметр);
	
	ЮТест.ОжидаетЧто(Параметр.Выгрузить()).Равно(Эталон.Выгрузить());
	
КонецПроцедуры

Процедура Тест_СвернутьТабличнуюЧасть_НесколькоРесурсов() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Эталон = Обработки.ЖЧТ_ОбработкаТестирования.Создать().СвернутьТабличнуюЧасть_НесколькоРесурсов;
	
	Строка = Эталон.Добавить();
	Строка.Измерение1 = 1;
	Строка.Ресурс1 = 5;
	
	Строка = Эталон.Добавить();
	Строка.Измерение2 = 1;
	Строка.Ресурс2 = 10;
	
	Строка = Эталон.Добавить();
	
	Параметр = Обработки.ЖЧТ_ОбработкаТестирования.Создать().СвернутьТабличнуюЧасть_НесколькоРесурсов;
	
	Строка = Параметр.Добавить();
	Строка.Измерение1 = 1;
	Строка.Ресурс1 = 3;
	
	Строка = Параметр.Добавить();
	Строка.Измерение1 = 1;
	Строка.Ресурс1 = 2;
	
	Строка = Параметр.Добавить();
	Строка.Измерение2 = 1;
	Строка.Ресурс2 = 1;
	
	Строка = Параметр.Добавить();
	Строка.Измерение2 = 1;
	Строка.Ресурс2 = 9;
	
	Строка = Параметр.Добавить();
	
	ТестируемыйМодуль.СвернутьТабличнуюЧасть(Параметр);
	
	ЮТест.ОжидаетЧто(Параметр.Выгрузить()).Равно(Эталон.Выгрузить());
	
КонецПроцедуры

Процедура Тест_СвернутьТабличнуюЧасть_БезИзмерений() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Эталон = Обработки.ЖЧТ_ОбработкаТестирования.Создать().СвернутьТабличнуюЧасть_БезИзмерений;
	Строка = Эталон.Добавить();
	Строка.Ресурс1 = 3;
	Строка.Ресурс2 = 7;
	Строка.Ресурс3 = 11;
	
	Параметр = Обработки.ЖЧТ_ОбработкаТестирования.Создать().СвернутьТабличнуюЧасть_БезИзмерений;
	Параметр.Добавить().Ресурс1 = 1;
	Параметр.Добавить().Ресурс1 = 2;
	Параметр.Добавить().Ресурс2 = 3;
	Параметр.Добавить().Ресурс2 = 4;
	Параметр.Добавить().Ресурс3 = 5;
	Параметр.Добавить().Ресурс3 = 6;
	
	ТестируемыйМодуль.СвернутьТабличнуюЧасть(Параметр);
	
	ЮТест.ОжидаетЧто(Параметр.Выгрузить()).Равно(Эталон.Выгрузить());
	
КонецПроцедуры

#КонецОбласти

#Область ТаблицаЗначенийБезNull

Процедура Тест_ТаблицаЗначенийБезNull() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Параметр = Новый ТаблицаЗначений;
	Параметр.Колонки.Добавить("К1", Новый ОписаниеТипов("Строка,Null"));
	Параметр.Колонки.Добавить("К2", Новый ОписаниеТипов("Число,Строка"));
	Параметр.Колонки.Добавить("К3", Новый ОписаниеТипов("Число,Дата,Null"));
	Параметр.Добавить().К1 = "тыц";
	Параметр.Добавить().К2 = "333";
	Параметр.Добавить().К3 = Null;
	
	Эталон = Новый ТаблицаЗначений;
	Эталон.Колонки.Добавить("К1", Новый ОписаниеТипов("Строка"));
	Эталон.Колонки.Добавить("К2", Новый ОписаниеТипов("Число,Строка"));
	Эталон.Колонки.Добавить("К3", Новый ОписаниеТипов("Число,Дата"));
	Эталон.Добавить().К1 = "тыц";
	Эталон.Добавить().К2 = "333";
	Эталон.Добавить().К3 = Неопределено;
	
	Результат = ТестируемыйМодуль.ТаблицаЗначенийБезNull(Параметр);
	
	ЮТест.ОжидаетЧто(Результат).Равно(Эталон);
	
КонецПроцедуры

#КонецОбласти

#Область ОбновленнаяКолонкаТаблицы

Процедура Тест_ОбновленнаяКолонкаТаблицы_Создание() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Ожидания = Новый Структура;
	Ожидания.Вставить("Имя", "К");
	Ожидания.Вставить("ТипЗначения", Новый ОписаниеТипов("Число"));
	Ожидания.Вставить("Заголовок", "Колонка");
	Ожидания.Вставить("Ширина", 69);
	
	Таблица = Новый ТаблицаЗначений();
	Колонка = ТестируемыйМодуль.ОбновленнаяКолонкаТаблицы(Таблица, 
		Ожидания.Имя, Ожидания.ТипЗначения, Ожидания.Заголовок, Ожидания.Ширина);
	
	Тестировщик = ЮТест.ОжидаетЧто(Колонка);
	Для Каждого КлючИЗначение Из Ожидания Цикл
		Тестировщик.Свойство(КлючИЗначение.Ключ).Равно(КлючИЗначение.Значение);
	КонецЦикла;
	
КонецПроцедуры

Процедура Тест_ОбновленнаяКолонкаТаблицы_Обновление() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Ожидания = Новый Структура;
	Ожидания.Вставить("Имя", "К");
	Ожидания.Вставить("ТипЗначения", Новый ОписаниеТипов("Число"));
	Ожидания.Вставить("Заголовок", "Колонка");
	Ожидания.Вставить("Ширина", 69);
	
	Таблица = Новый ТаблицаЗначений();
	Колонка = Таблица.Колонки.Добавить(Ожидания.Имя, Ожидания.ТипЗначения);
	Результат = ТестируемыйМодуль.ОбновленнаяКолонкаТаблицы(Таблица, 
		Ожидания.Имя, Ожидания.ТипЗначения, Ожидания.Заголовок, Ожидания.Ширина);
	
	Тестировщик = ЮТест.ОжидаетЧто(Колонка).Равно(Результат);
	Для Каждого КлючИЗначение Из Ожидания Цикл
		Тестировщик.Свойство(КлючИЗначение.Ключ).Равно(КлючИЗначение.Значение);
	КонецЦикла;
	
КонецПроцедуры

Процедура Тест_ОбновленнаяКолонкаТаблицы_ОбновлениеКромеТипа() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Ожидания = Новый Структура;
	Ожидания.Вставить("Имя", "К");
	Ожидания.Вставить("СтарыйТипЗначения", Новый ОписаниеТипов("Число"));
	Ожидания.Вставить("НовыйТипЗначения", Новый ОписаниеТипов("Строка"));
	
	Таблица = Новый ТаблицаЗначений();
	Колонка = Таблица.Колонки.Добавить(Ожидания.Имя, Ожидания.СтарыйТипЗначения);
	Результат = ТестируемыйМодуль.ОбновленнаяКолонкаТаблицы(Таблица, Ожидания.Имя, Ожидания.НовыйТипЗначения);
	
	Тестировщик = ЮТест.ОжидаетЧто(Колонка)
		.Равно(Результат)
			.Свойство("ТипЗначения")
			.Равно(Ожидания.СтарыйТипЗначения);

КонецПроцедуры

#КонецОбласти

#Область ТаблицаЗначенийСПлохойКолонкой

Процедура Тест_ТаблицаЗначенийСПлохойКолонкой(НоваяТаблица) Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Ожидаемые = Новый Структура;
	Ожидаемые.Вставить("Имя", "1");
	Ожидаемые.Вставить("Тип", Новый ОписаниеТипов("Строка"));
	Ожидаемые.Вставить("Заголовок", "Тест");
	
	Если НоваяТаблица Тогда
		Таблица = Новый ТаблицаЗначений();
		Таблица.Колонки.Добавить("К");
	Иначе
		Таблица = Неопределено;
	КонецЕсли;
	
	Результат = ТестируемыйМодуль.ТаблицаЗначенийСПлохойКолонкой(Ожидаемые.Имя, 
		Таблица, Ожидаемые.Тип, Ожидаемые.Заголовок);
	
	Если НоваяТаблица Тогда
		ЮТест.ОжидаетЧто(Результат.Колонки.Количество()).Равно(Таблица.Колонки.Количество());
	КонецЕсли;
	
	Колонка = Результат.Колонки[Ожидаемые.Имя];
	ЮТест.ОжидаетЧто(Колонка)
		.ИмеетТип("КолонкаТаблицыЗначений")
		.Свойство("ТипЗначения").Равно(Ожидаемые.Тип)
		.Свойство("Заголовок").Равно(Ожидаемые.Заголовок)
	;
	
КонецПроцедуры

#КонецОбласти

#Область ПустыеКолонкиТаблицыЗначений

Процедура Тест_ПустыеКолонкиТаблицыЗначений_ПустаяТаблицаБезКолонок() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Таблица = Новый ТаблицаЗначений;
	Результат = ТестируемыйМодуль.ПустыеКолонкиТаблицыЗначений(Таблица);
	
	ЮТест.ОжидаетЧто(Результат)
		.ИмеетТип("Массив")
		.ИмеетДлину(0)
	;
	
КонецПроцедуры

Процедура Тест_ПустыеКолонкиТаблицыЗначений_БезКолонокИЕстьСтроки() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Таблица = Новый ТаблицаЗначений;
	Таблица.Добавить();
	Таблица.Добавить();
	
	Результат = ТестируемыйМодуль.ПустыеКолонкиТаблицыЗначений(Таблица);
	
	ЮТест.ОжидаетЧто(Результат)
		.ИмеетТип("Массив")
		.ИмеетДлину(0)
	;
	
КонецПроцедуры

Процедура Тест_ПустыеКолонкиТаблицыЗначений_ПустаяТаблицаСКолонками() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Колонки = СтрРазделить("К1,К2,К3", ",");
	
	Таблица = Новый ТаблицаЗначений;
	Для Каждого ИмяКолонки Из Колонки Цикл
		Таблица.Колонки.Добавить(ИмяКолонки);
	КонецЦикла;
	
	Результат = ТестируемыйМодуль.ПустыеКолонкиТаблицыЗначений(Таблица);
	
	ЮТест.ОжидаетЧто(Результат)
		.ИмеетТип("Массив")
		.Равно(Колонки)
	;
	
КонецПроцедуры

Процедура Тест_ПустыеКолонкиТаблицыЗначений_ТаблицаСКолонкамиИСПустымиСтроками() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Колонки = СтрРазделить("К1,К2,К3", ",");
	
	Таблица = Новый ТаблицаЗначений;
	Для Каждого ИмяКолонки Из Колонки Цикл
		Таблица.Колонки.Добавить(ИмяКолонки);
	КонецЦикла;
	
	Таблица.Добавить();
	Таблица.Добавить();
	Таблица.Добавить();
	
	Результат = ТестируемыйМодуль.ПустыеКолонкиТаблицыЗначений(Таблица);
	
	ЮТест.ОжидаетЧто(Результат)
		.ИмеетТип("Массив")
		.Равно(Колонки)
	;
	
КонецПроцедуры

Процедура Тест_ПустыеКолонкиТаблицыЗначений_ТаблицаСоСтрокамиИБезПустыхКолонок() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Таблица = Новый ТаблицаЗначений;
	Таблица.Колонки.Добавить("К1");
	Таблица.Колонки.Добавить("К2");
	Таблица.Колонки.Добавить("К3");
	
	Для НомерСтроки = 1 По 3 Цикл
		Строка = Таблица.Добавить();
		Строка.К1 = Новый УникальныйИдентификатор();
		Строка.К2 = Новый УникальныйИдентификатор();
		Строка.К3 = Новый УникальныйИдентификатор();
	КонецЦикла;
	
	Результат = ТестируемыйМодуль.ПустыеКолонкиТаблицыЗначений(Таблица);
	
	ЮТест.ОжидаетЧто(Результат)
		.ИмеетТип("Массив")
		.ИмеетДлину(0)
	;
	
КонецПроцедуры

Процедура Тест_ПустыеКолонкиТаблицыЗначений_ТаблицаСоСтрокамиИСПустойКолонкой() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Таблица = Новый ТаблицаЗначений;
	Таблица.Колонки.Добавить("К1");
	Таблица.Колонки.Добавить("К2");
	Таблица.Колонки.Добавить("К3");
	
	Для НомерСтроки = 1 По 3 Цикл
		Строка = Таблица.Добавить();
		Строка.К1 = Новый УникальныйИдентификатор();
		Строка.К2 = Неопределено; //Пустая колонка
		Строка.К3 = Новый УникальныйИдентификатор();
	КонецЦикла;
	
	Результат = ТестируемыйМодуль.ПустыеКолонкиТаблицыЗначений(Таблица);
	
	ЮТест.ОжидаетЧто(Результат)
		.ИмеетТип("Массив")
		.ИмеетДлину(1)
		.Элемент(0)
			.Равно("К2")
	;
	
КонецПроцедуры

Процедура Тест_ПустыеКолонкиТаблицыЗначений_ТаблицаСоСтрокамиИСПочтиПустойКолонкой() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Таблица = Новый ТаблицаЗначений;
	Таблица.Колонки.Добавить("К1");
	
	Таблица.Добавить().К1 = Новый УникальныйИдентификатор();
	Таблица.Добавить().К1 = Неопределено;
	
	Результат = ТестируемыйМодуль.ПустыеКолонкиТаблицыЗначений(Таблица);
	
	ЮТест.ОжидаетЧто(Результат)
		.ИмеетТип("Массив")
		.ИмеетДлину(0)
	;
	
КонецПроцедуры

#КонецОбласти

#Область ЗаполнитьТаблицуЗначенийИзСтроки

Процедура Тест_ЗаполнитьТаблицуЗначенийИзСтроки() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Строка = 
	"К1 | К2 | К3
	|А  | 1  | 16.02.2024 00:00:00
	|Б  | 2  | 17.02.2024 00:00:00
	|   |    |";
	
	Таблица = Новый ТаблицаЗначений;
	Таблица.Колонки.Добавить("К2", Новый ОписаниеТипов("Число"));
	Таблица.Колонки.Добавить("К3", Новый ОписаниеТипов("Дата"));
	
	ТестируемыйМодуль.ЗаполнитьТаблицуЗначенийИзСтроки(Строка, Таблица, Истина);
	
	ЮТест.ОжидаетЧто(Таблица)
		.Свойство("[0].К1").Равно("А")
		.Свойство("[0].К2").Равно(1)
		.Свойство("[0].К3").Равно('2024 02 16')
		.Свойство("[1].К1").Равно("Б")
		.Свойство("[1].К2").Равно(2)
		.Свойство("[1].К3").Равно('2024 02 17')
		.Свойство("[2].К1").Равно("")
		.Свойство("[2].К2").Равно(0)
		.Свойство("[2].К3").Равно('0001 01 01')
	;
	
КонецПроцедуры

#КонецОбласти

#Область ВыгрузитьКолонку

Процедура Тест_ВыгрузитьКолонку() Экспорт

		Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();
	
	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Макет = 
	" К1 | К2 |
	| 1  | 1  |
	| 1  | 3  |
	| 1  | 2  |
	| 1  | 4  |
	| 1  | 3  |
	|";
    Таблица = ТестируемыйМодуль.ТаблицаЗначенийИзСтроки(Макет);
	
	Результат = ТестируемыйМодуль.ВыгрузитьКолонку(Таблица, "К1", Ложь, Ложь);
	Ожидание = Таблица.ВыгрузитьКолонку("К1");
	ЮТест.ОжидаетЧто(Результат, "Выгрузка колонки одинаковых значений без сворачивания").Равно(Ожидание);
	
	Результат = ТестируемыйМодуль.ВыгрузитьКолонку(Таблица, "К1", Истина, Ложь);
	Ожидание = СтрРазделить("1", ",");
	ЮТест.ОжидаетЧто(Результат, "Выгрузка колонки одинаковых значений со свёрткой").Равно(Ожидание);
	
	Результат = ТестируемыйМодуль.ВыгрузитьКолонку(Таблица, "К2", Истина, Ложь);
	Ожидание = СтрРазделить("1,3,2,4", ",");
	ЮТест.ОжидаетЧто(Результат, "Выгрузка колонки значений со свёрткой").Равно(Ожидание);
	
	Результат = ТестируемыйМодуль.ВыгрузитьКолонку(Таблица, "К2", Истина, Истина);
	Ожидание = СтрРазделить("1,2,3,4", ",");
	ЮТест.ОжидаетЧто(Результат, "Выгрузка колонки значений со свёрткой и сортировкой").Равно(Ожидание);
	
КонецПроцедуры

#КонецОбласти

#Область ИменаКолонокТаблицы

Процедура Тест_ИменаКолонокТаблицы(ИменаКолонок) Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();
	
	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Таблица = Новый ТаблицаЗначений();
	МассивИмен = СтрРазделить(ИменаКолонок, ",", Ложь);
	Для Каждого ИмяКолонки Из МассивИмен Цикл
		Таблица.Колонки.Добавить(ИмяКолонки);
	КонецЦикла;
	
	Результат = ТестируемыйМодуль.ИменаКолонокТаблицы(Таблица);
	ЮТест.ОжидаетЧто(Результат).Равно(МассивИмен);
	
КонецПроцедуры

#КонецОбласти

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Тестируемый модуль.
// 
// Возвращаемое значение:
//  ОбщийМодуль
Функция ТестируемыйМодуль() Экспорт

	Возврат ЖЧТ_Модули.РаботаСКоллекциями();
	
КонецФункции

#КонецОбласти
