
#Область СлужебныйПрограммныйИнтерфейс

// Регистрация тестов
Процедура ИсполняемыеСценарии() Экспорт

	Перем ЮТТесты;
	ЮТТесты = ЖЧТ_Движок.ЮТТесты();
	
	ЮТТесты
		.ДобавитьТестовыйНабор("НовыйОбъект")
			.ДобавитьТест("Тест_НовыйОбъект")
				.СПараметрами("Число")
				.СПараметрами("Строка")
				.СПараметрами("Массив")
				.СПараметрами("СписокЗначений")
				.СПараметрами("Структура")
				.СПараметрами("ДанныеФормыСтруктура")
		.ДобавитьТестовыйНабор("ОписаниеТипов")
			.ДобавитьТест("Тест_ОписаниеТипов_ОписаниеТипов", "Описание типов из описания типов")
			.ДобавитьТест("Тест_ОписаниеТипов_Неопределено", "Описание типов из Неопределено")
			.ДобавитьТест("Тест_ОписаниеТипов_Тип", "Описание типов из Тип")
			.ДобавитьТест("Тест_ОписаниеТипов_МассивТипов", "Описание типов из массива типов")
			.ДобавитьТест("Тест_ОписаниеТипов_Строка", "Описание типов из Строка")
		.ДобавитьТестовыйНабор("Массив")
			.ДобавитьТест("Тест_Массив_Строка", "Массив из строки")
			.ДобавитьТест("Тест_Массив_Массив", "Массив из массив")
			.ДобавитьТест("Тест_Массив_СписокЗначений", "Массив из СписокЗначений")
			.ДобавитьТест("Тест_Массив_Произвольный", "Массив из Произвольный")
			.ДобавитьТест("Тест_Массив_Неопределено", "Неопределено из Неопределено")
		.ДобавитьТестовыйНабор("ЗначениеСоответствуетШаблону")
			.ДобавитьТест("Тест_ЗначениеСоответствуетШаблону_ЛожьЕслиНеСтруктура", "Ложь, если НЕ структура")
			.ДобавитьТест("Тест_ЗначениеСоответствуетШаблону_ЛожьЕслиЛишнееСвойство", "Ложь, если в значении лишнее свойство")
			.ДобавитьТест("Тест_ЗначениеСоответствуетШаблону_ЛожьЕслиНедостающееСвойство", "Ложь, если в значении не хватает свойства")
			.ДобавитьТест("Тест_ЗначениеСоответствуетШаблону_ИстинаЕслиПустаяСтруктура", "Истина, если пустая структура")
			.ДобавитьТест("Тест_ЗначениеСоответствуетШаблону_ИстинаЕслиСоответствует", "Истина, если значение соответствует шаблону")
		.ДобавитьТестовыйНабор("Структура")
			.ДобавитьТест("Тест_Структура_ПолнаяКопия", "Копия структуры")
			.ДобавитьТест("Тест_Структура_Пустая", "Пустая структура")
			.ДобавитьТест("Тест_Структура_Исключение", "Исключение свойств")
			.ДобавитьТест("Тест_Структура_Оставления", "Оставления свойств")
			.ДобавитьТест("Тест_Структура_ИсключенияИОставления", "И исключение и оставление")
		.ДобавитьТестовыйНабор("ПривестиЧисло")
			.ДобавитьТест("Тест_ПривестиЧисло", "Проверка метода ограничения числа")
				.СПараметрами(1, -1, 2, 1)
				.СПараметрами(0, 1, 2, 1)
				.СПараметрами(1, Неопределено, Неопределено, 1)
				.СПараметрами(-5, 0, Неопределено, 0)
				.СПараметрами("", 0, Неопределено, 0)
				.СПараметрами("", Неопределено, Неопределено, Неопределено)
		.ДобавитьТестовыйНабор("ТипСуществует")
			.ДобавитьКлиентскийТест("Тест_ТипСуществует")
				.СПараметрами("Число", Истина)
				.СПараметрами("ОписаниеОповещения", Истина)
				.СПараметрами("ТаблицаЗначений", Ложь)
				.СПараметрами("Запрос", Ложь)
				.СПараметрами("БлаБлаБла", Ложь)				
			.ДобавитьСерверныйТест("Тест_ТипСуществует")
				.СПараметрами("Число", Истина)
				.СПараметрами("ОписаниеОповещения", Ложь)
				.СПараметрами("ТаблицаЗначений", Истина)
				.СПараметрами("Запрос", Истина)
				.СПараметрами("БлаБлаБла", Ложь)
		.ДобавитьТестовыйНабор("ЭтоТипОдинИзТипов")
			.ДобавитьТест("Тест_ЭтоТипОдинИзТипов")
				.СПараметрами(Истина, "Число", "Число,Строка")
				.СПараметрами(Истина, "Число", "Строка,Число")
				.СПараметрами(Истина, "Число", "Число")
				.СПараметрами(Ложь, "Число", "Строка,Булево")
				.СПараметрами(Ложь, "Число", "Строка")
		.ДобавитьТестовыйНабор("ИмяСвойстваКорректно")
			.ДобавитьТест("Тест_ИмяСвойстваКорректно")
				.СПараметрами(Истина, "Тест")
				.СПараметрами(Истина, "Тест123_123")
				.СПараметрами(Истина, "_Тест12")
				.СПараметрами(Ложь  , "1")
				.СПараметрами(Ложь  , "те ст")
				.СПараметрами(Ложь  , "#у")
		.ДобавитьТестовыйНабор("ИменаСвойствОбъектаМетаданных")
			.ДобавитьСерверныйТест("Тест_ИменаСвойствОбъектаМетаданных")
				.СПараметрами("Справочник.ЖЧТ_ТестовыйСправочник", 
					"Номер,ИмяПредопределенныхДанных,Предопределенный,Ссылка,ПометкаУдаления,Родитель,Наименование,Код,ТестоваяТЧ")
				.СПараметрами("Справочник.ЖЧТ_ТестовыйСправочник", 
					"ИмяПредопределенныхДанных,Предопределенный,Ссылка,ПометкаУдаления,Родитель,Наименование,Код", 
					"СтандартныеРеквизиты")
				.СПараметрами("Справочник.ЖЧТ_ТестовыйСправочник", 
					"Номер", "Реквизиты")
				.СПараметрами("Справочник.ЖЧТ_ТестовыйСправочник", 
					"ТестоваяТЧ", "ТабличныеЧасти")
				.СПараметрами("Справочник.ВариантыОтчетов", 
					"НаименованиеЯзык1,НаименованиеЯзык2,ОбластьДанныхОсновныеДанные", 
					"ОбщиеРеквизиты")
		.ДобавитьТестовыйНабор("ЭтоМенеджерЗаписиРегистраСведений")
			.ДобавитьСерверныйТест("Тест_ЭтоМенеджерЗаписиРегистраСведений")
				.СПараметрами("Число", Ложь)
				.СПараметрами("Строка", Ложь)
				.СПараметрами("РегистрСведенийНаборЗаписей.ЖЧТ_РегистрСведений", Ложь)
				.СПараметрами("РегистрСведенийМенеджерЗаписи.ЖЧТ_РегистрСведений", Истина)
		.ДобавитьТестовыйНабор("ПустыеЗначенияПоОписаниюТипов")
			.ДобавитьТест("Тест_ПустыеЗначенияПоОписаниюТипов")
				.СПараметрами("Число", 0)
				.СПараметрами("Число,Строка", 0, "", Неопределено)
				.СПараметрами("Число,Строка,Булево", 0, "", Ложь, Неопределено)
				.СПараметрами("Число,Строка,СправочникСсылка.ЖЧТ_ТестовыйСправочник", 
					0, "", ПредопределенноеЗначение("Справочник.ЖЧТ_ТестовыйСправочник.ПустаяСсылка"), Неопределено)
		.ДобавитьТестовыйНабор("МетодСуществует")
			.ДобавитьТест("Тест_МетодСуществует")
				.СПараметрами("Неопределено", "Выполнить", Ложь)
				.СПараметрами("Число", "Выполнить", Ложь)
				.СПараметрами("Строка", "Выполнить", Ложь)
				.СПараметрами("Массив", "Добавить", Истина)
				.СПараметрами("Массив", "Количество", Истина)
				.СПараметрами("Массив", "Пук", Ложь)
			.ДобавитьСерверныйТест("Тест_МетодСуществует")
				.СПараметрами("Запрос", "Выполнить", Истина)
			.ДобавитьКлиентскийТест("Тест_МетодСуществует")
				.СПараметрами("ДанныеФормыСтруктура", "Свойство", Истина)
		.ДобавитьТестовыйНабор("СтруктураТаблицыБазы")
			.ДобавитьСерверныйТест("Тест_СтруктураТаблицыБазы_Справочник")
		
	;

КонецПроцедуры

#Область Тесты

#Область НовыйОбъект

Процедура Тест_НовыйОбъект(ИмяТипа) Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Тип = Тип(ИмяТипа);
	
	Результат = ТестируемыйМодуль.НовыйОбъект(ИмяТипа);
	ЮТест.ОжидаетЧто(Результат, "По имени типа").ИмеетТип(Тип);
	
	Результат = ТестируемыйМодуль.НовыйОбъект(Тип);
	ЮТест.ОжидаетЧто(Результат, "По типу").ИмеетТип(Тип);
	
КонецПроцедуры

#КонецОбласти

#Область ОписаниеТипов

Процедура Тест_ОписаниеТипов_ОписаниеТипов() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Параметр = Новый ОписаниеТипов();
	Результат = ТестируемыйМодуль.ОписаниеТипов(Параметр);
	
	ЮТест.ОжидаетЧто(Результат).Равно(Параметр);
	
КонецПроцедуры

Процедура Тест_ОписаниеТипов_Неопределено() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Результат = ТестируемыйМодуль.ОписаниеТипов(Неопределено);
	
	ЮТест.ОжидаетЧто(Результат).ИмеетТип(Тип("ОписаниеТипов"));
			
	ЮТест.ОжидаетЧто(Результат.Типы().Количество()).Равно(0);
	
КонецПроцедуры

Процедура Тест_ОписаниеТипов_Тип() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Параметр = Тип("Строка");
	Результат = ТестируемыйМодуль.ОписаниеТипов(Параметр);
	
	ЮТест.ОжидаетЧто(Результат).ИмеетТип(Тип("ОписаниеТипов"));
	
	ТипыРезультата = Результат.Типы();
	
	ЮТест.ОжидаетЧто(ТипыРезультата.Количество()).Равно(1);
	
	ЮТест.ОжидаетЧто(ТипыРезультата[0]).Равно(Параметр);
	
КонецПроцедуры

Процедура Тест_ОписаниеТипов_МассивТипов() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Параметр = Новый Массив;
	Параметр.Добавить(Тип("Строка"));
	Результат = ТестируемыйМодуль.ОписаниеТипов(Параметр);
	
	ЮТест.ОжидаетЧто(Результат).ИмеетТип(Тип("ОписаниеТипов"));
	
	ТипыРезультата = Результат.Типы();
	
	ЮТест.ОжидаетЧто(ТипыРезультата.Количество()).Равно(Параметр.Количество());
	
	ЮТест.ОжидаетЧто(ТипыРезультата[0]).Равно(Параметр[0]);
	
КонецПроцедуры

Процедура Тест_ОписаниеТипов_Строка() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Параметр = "Строка,Число,Булево";
	ПроверяемыеТипы = СтрРазделить(Параметр, ",");
	Результат = ТестируемыйМодуль.ОписаниеТипов(Параметр);
	
	ЮТест.ОжидаетЧто(Результат).ИмеетТип(Тип("ОписаниеТипов"));
	
	ТипыРезультата = Результат.Типы();
	
	ЮТест.ОжидаетЧто(ТипыРезультата.Количество()).Равно(ПроверяемыеТипы.Количество());
	
	Для Каждого Тип Из ПроверяемыеТипы Цикл
		ЮТест.ОжидаетЧто(Результат.СодержитТип(Тип(Тип))).ЭтоИстина();
	КонецЦикла;
	
КонецПроцедуры

#КонецОбласти

#Область ПривестиЧисло

Процедура Тест_ПривестиЧисло(Знач Число, Минимум, Максимум, Результат) Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль().ПривестиЧисло(Число, Минимум, Максимум);
	ЮТест.ОжидаетЧто(Число).Равно(Результат);
	
КонецПроцедуры

#КонецОбласти

#Область Массив

Процедура Тест_Массив_Строка() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	Источник = "З1,З2
	|З3,З4,,,
	|З5";
	
	Эталон = СтрРазделить(Источник, "," + Символы.ПС, Ложь);
	
	Результат = ТестируемыйМодуль().Массив(Источник);
	ЮТест.ОжидаетЧто(Результат).ИмеетТип("Массив").Равно(Эталон);
	
КонецПроцедуры

Процедура Тест_Массив_Массив() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	Источник = Новый Массив;
	Источник.Добавить(Новый УникальныйИдентификатор());
	
	Эталон = Источник;
	
	Результат = ТестируемыйМодуль().Массив(Источник);
	ЮТест.ОжидаетЧто(Результат).ИмеетТип("Массив").Равно(Эталон);
	
КонецПроцедуры

Процедура Тест_Массив_СписокЗначений() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	Источник = Новый СписокЗначений;
	Источник.Добавить(Новый УникальныйИдентификатор());
	
	Эталон = Источник.ВыгрузитьЗначения();
	
	Результат = ТестируемыйМодуль().Массив(Источник);
	ЮТест.ОжидаетЧто(Результат).ИмеетТип("Массив").Равно(Эталон);
	
КонецПроцедуры

Процедура Тест_Массив_Произвольный() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	Источник = Новый УникальныйИдентификатор();
	
	Эталон = Новый Массив;
	Эталон.Добавить(Источник);
	
	Результат = ТестируемыйМодуль().Массив(Источник);
	ЮТест.ОжидаетЧто(Результат).ИмеетТип("Массив").Равно(Эталон);
	
КонецПроцедуры

Процедура Тест_Массив_Неопределено() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	Источник = Неопределено;
	
	Результат = ТестируемыйМодуль().Массив(Источник);
	ЮТест.ОжидаетЧто(Результат).ИмеетТип("Неопределено");
	
КонецПроцедуры

#КонецОбласти

#Область ЗаполнитьСтруктуруРекурсивно

Процедура Тест_ЗаполнитьСтруктуруРекурсивно_ПримитивноеДополнение() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	Источник = Новый Структура("а,б,в", 1, 2, 3);
	Приемник = Новый Структура("а,в,г,д", 0, 0, 4, 5);
	Эталон   = Новый Структура("а,б,в,г,д", 1, 2, 3, 4, 5);
	
	Модуль = ТестируемыйМодуль();
	Модуль.ЗаполнитьСтруктуруРекурсивно(Приемник, Источник, Ложь, Истина);
	ЮТест.ОжидаетЧто(Приемник).Равно(Эталон);
	
КонецПроцедуры

Процедура Тест_ЗаполнитьСтруктуруРекурсивно_Рекурсивно() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	Источник = Новый Структура("а,б", Новый Структура("аа", 1), Новый Структура("бб", 2));
	Приемник = Новый Структура("а,б", Новый Структура("аа", 3), Новый Структура("бб", 4));
	Эталон   = Источник;
	
	Модуль = ТестируемыйМодуль();
	Модуль.ЗаполнитьСтруктуруРекурсивно(Приемник, Источник);
	ЮТест.ОжидаетЧто(Приемник).Равно(Эталон);
	
КонецПроцедуры

Процедура Тест_ЗаполнитьСтруктуруРекурсивно_РекурсивноДополнять() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	Источник = Новый Структура("а,в"  , Новый Структура("аа", 1), Новый Структура("вв", 2));
	Приемник = Новый Структура("а,б"  , Новый Структура("аа", 3), Новый Структура("бб", 4));
	Эталон   = Новый Структура("а,б,в", Новый Структура("аа", 1), Новый Структура("бб", 4), Новый Структура("вв", 2));
	
	Модуль = ТестируемыйМодуль();
	Модуль.ЗаполнитьСтруктуруРекурсивно(Приемник, Источник, Ложь, Истина);
	ЮТест.ОжидаетЧто(Приемник).Равно(Эталон);
	
КонецПроцедуры

#КонецОбласти

#Область ЗначениеСоответствуетШаблону

Процедура Тест_ЗначениеСоответствуетШаблону_ЛожьЕслиНеСтруктура() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Результат = ТестируемыйМодуль.ЗначениеСоответствуетШаблону(1,1);
	
	ЮТест.ОжидаетЧто(Результат).ЭтоЛожь();
	
КонецПроцедуры

Процедура Тест_ЗначениеСоответствуетШаблону_ЛожьЕслиЛишнееСвойство() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Результат = ТестируемыйМодуль.ЗначениеСоответствуетШаблону(
		Новый Структура("С1,С2,С3"), Новый Структура("С1,С2"));
	
	ЮТест.ОжидаетЧто(Результат).ЭтоЛожь();
	
КонецПроцедуры

Процедура Тест_ЗначениеСоответствуетШаблону_ЛожьЕслиНедостающееСвойство() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Результат = ТестируемыйМодуль.ЗначениеСоответствуетШаблону(
		Новый Структура("С1,С2"), Новый Структура("С1,С2,С3"));
	
	ЮТест.ОжидаетЧто(Результат).ЭтоЛожь();
	
КонецПроцедуры

Процедура Тест_ЗначениеСоответствуетШаблону_ИстинаЕслиПустаяСтруктура() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Результат = ТестируемыйМодуль.ЗначениеСоответствуетШаблону(
		Новый Структура, Новый Структура);
	
	ЮТест.ОжидаетЧто(Результат).ЭтоИстина();
	
КонецПроцедуры

Процедура Тест_ЗначениеСоответствуетШаблону_ИстинаЕслиСоответствует() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Результат = ТестируемыйМодуль.ЗначениеСоответствуетШаблону(
		Новый Структура("С1,С2,С3"), Новый Структура("С1,С2,С3"));
	
	ЮТест.ОжидаетЧто(Результат).ЭтоИстина();
	
КонецПроцедуры

#КонецОбласти

#Область Структура

Процедура Тест_Структура_ПолнаяКопия() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	Источник = Новый Структура("а,б,в");
	Эталон = Источник;
	
	Результат = ТестируемыйМодуль().Структура(Источник);
	ЮТест.ОжидаетЧто(Результат).ИмеетТип("Структура").Равно(Эталон);
	
КонецПроцедуры

Процедура Тест_Структура_Пустая() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	Источник = Новый Структура("а,б,в");
	
	Результат = ТестируемыйМодуль().Структура(Источник,,,Истина);
	ЮТест.ОжидаетЧто(Результат).ИмеетТип("Структура").ИмеетДлину(0);
	
КонецПроцедуры

Процедура Тест_Структура_Исключение() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	Источник = Новый Структура("а,б,в,г");
	Исключения = "а,в,д";
	Эталон = Новый Структура("б,г");
	
	Результат = ТестируемыйМодуль().Структура(Источник, Исключения);
	ЮТест.ОжидаетЧто(Результат).ИмеетТип("Структура").Равно(Эталон);
	
КонецПроцедуры

Процедура Тест_Структура_Оставления() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	Источник = Новый Структура("а,б,в,г");
	Оставления = "б,г,д";
	Эталон = Новый Структура("б,г");
	
	Результат = ТестируемыйМодуль().Структура(Источник, , Оставления, Истина);
	ЮТест.ОжидаетЧто(Результат).ИмеетТип("Структура").Равно(Эталон);
	
КонецПроцедуры

Процедура Тест_Структура_ИсключенияИОставления() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	Источник = Новый Структура("а,б,в,г");
	Исключения = "а,д";
	Оставления = "б,д";
	Эталон = Новый Структура("б,в,г");
	
	Результат = ТестируемыйМодуль().Структура(Источник, Исключения, Оставления, Истина);
	ЮТест.ОжидаетЧто(Результат).ИмеетТип("Структура").Равно(Эталон);
	
КонецПроцедуры

#КонецОбласти

#Область ТипСуществует

Процедура Тест_ТипСуществует(ИмяТипа, Существует) Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	Модуль = ТестируемыйМодуль();
	Результат = Модуль.ТипСуществует(ИмяТипа);
	ЮТест.ОжидаетЧто(Существует, "Проверка существования типа: " + ИмяТипа).Равно(Результат);
	
КонецПроцедуры

#КонецОбласти

#Область ЭтоТипОдинИзТипов

Процедура Тест_ЭтоТипОдинИзТипов(ОжидаемыйРезультат, ИмяТипа, ТипыСтрокой) Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	Тип = Тип(ИмяТипа);
	Модуль = ТестируемыйМодуль();
	
	Проверка = "Коллекция типов строкой через ,";
	Типы = ТипыСтрокой;
	Результат = Модуль.ЭтоТипОдинИзТипов(Тип, Типы);
	ЮТест.ОжидаетЧто(ОжидаемыйРезультат, Проверка).Равно(Результат);
	
	Проверка = "Коллекция типов массивом строк";
	Типы = СтрРазделить(ТипыСтрокой, ",", Ложь);
	Результат = Модуль.ЭтоТипОдинИзТипов(Тип, Типы);
	ЮТест.ОжидаетЧто(ОжидаемыйРезультат, Проверка).Равно(Результат);
	
	Проверка = "Коллекция типов массивом типов";
	Для Индекс = 0 По Типы.Количество() - 1 Цикл
		Типы[Индекс] = Тип(Типы[Индекс]);
	КонецЦикла;
	Результат = Модуль.ЭтоТипОдинИзТипов(Тип, Типы);
	ЮТест.ОжидаетЧто(ОжидаемыйРезультат, Проверка).Равно(Результат);
	
	Если Типы.Количество() = 1 Тогда
		Проверка = "Один проверяемый тип";
		Результат = Модуль.ЭтоТипОдинИзТипов(Тип, Типы[0]);
		ЮТест.ОжидаетЧто(ОжидаемыйРезультат, Проверка).Равно(Результат);
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область ИмяСвойстваКорректно

Процедура Тест_ИмяСвойстваКорректно(ОжидаемыйРезультат, ИмяСвойства) Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	Модуль = ТестируемыйМодуль();
	Результат = Модуль.ИмяСвойстваКорректно(ИмяСвойства);
	ЮТест.ОжидаетЧто(ОжидаемыйРезультат).Равно(Результат);
	
КонецПроцедуры

#КонецОбласти

#Область ПустыеЗначенияПоОписаниюТипов

Процедура Тест_ПустыеЗначенияПоОписаниюТипов(ТипыОписания, 
	Значение1 = "_!%*", 
	Значение2 = "_!%*", 
	Значение3 = "_!%*", 
	Значение4 = "_!%*", 
	Значение5 = "_!%*") Экспорт

	Перем ЮТест,ЮТКоллекции;
	ЮТест = ЖЧТ_Движок.ЮТест();
	ЮТКоллекции = ЖЧТ_Движок.ЮТКоллекции();
	
	Модуль = ТестируемыйМодуль();
	ОписаниеТипов = Новый ОписаниеТипов(ТипыОписания);
	
	ОжидаемыеЗначения = ЮТКоллекции.ЗначениеВМассиве(Значение1, Значение2, Значение3, Значение4, Значение5);
	Результат = Модуль.ПустыеЗначенияПоОписаниюТипов(ОписаниеТипов);
	
	ОжидаемыеЗначения = ЖЧТ_Общее.СортированныйМассив(ОжидаемыеЗначения);
	Результат = ЖЧТ_Общее.СортированныйМассив(Результат);
	ЮТест.ОжидаетЧто(Результат).Равно(ОжидаемыеЗначения);
	
КонецПроцедуры

#КонецОбласти

#Область МетодСуществует

Процедура Тест_МетодСуществует(ТипОбъекта, ИмяМетода, МетодСуществует) Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();
	
	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Объект = ТестируемыйМодуль.НовыйОбъект(ТипОбъекта);
	
	Результат = ТестируемыйМодуль.МетодСуществует(Объект, ИмяМетода);
	
	ЮТест.ОжидаетЧто(Результат).Равно(МетодСуществует);
	
КонецПроцедуры

#КонецОбласти

#Если Сервер Тогда

#Область ИменаСвойствОбъектаМетаданных

Процедура Тест_ИменаСвойствОбъектаМетаданных(ПолноеИмяМетаданных, ОжидаемыйРезультатСтрокой, ПроверяемыеСвойства = "") Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();
	
	ОжидаемыйРезультат = СтрРазделить(ОжидаемыйРезультатСтрокой, ",");

	Модуль = ТестируемыйМодуль();
	Результат = Модуль.ИменаСвойствОбъектаМетаданных(ПолноеИмяМетаданных, ПроверяемыеСвойства);
	ЮТест.ОжидаетЧто(Результат).Равно(ОжидаемыйРезультат);
	
КонецПроцедуры

#КонецОбласти

#Область ЭтоМенеджерЗаписиРегистраСведений

Процедура Тест_ЭтоМенеджерЗаписиРегистраСведений(ИмяТипаЗначения, ОжидаемыйРезультат) Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();
	
	Модуль = ТестируемыйМодуль();
	Результат = Модуль.ЭтоМенеджерЗаписиРегистраСведений(Тип(ИмяТипаЗначения));
	ЮТест.ОжидаетЧто(Результат).Равно(ОжидаемыйРезультат);
	
КонецПроцедуры

#КонецОбласти

#Область СтруктураТаблицыБазы

Процедура Тест_СтруктураТаблицыБазы_Справочник() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();
	
	ОбъектМетаданных = Метаданные.Справочники.ЖЧТ_ТестовыйСправочник;
	
	Модуль = ТестируемыйМодуль();
	Результат = Модуль.СтруктураТаблицыБазы(ОбъектМетаданных.ПолноеИмя());
	
	ЮТест.ОжидаетЧто(Результат.Колонки)
		.Свойство("Ссылка.ТипЗначения")
			.Равно(ОбъектМетаданных.СтандартныеРеквизиты.Ссылка.Тип)
		.Свойство("ПометкаУдаления.ТипЗначения")
			.Равно(ОбъектМетаданных.СтандартныеРеквизиты.ПометкаУдаления.Тип)
		.Свойство("Наименование.ТипЗначения")
			.Равно(ОбъектМетаданных.СтандартныеРеквизиты.Наименование.Тип)
		.Свойство("Номер.ТипЗначения")
			.Равно(ОбъектМетаданных.Реквизиты.Номер.Тип)
		;
	
КонецПроцедуры

#КонецОбласти

#КонецЕсли

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Тестируемый модуль.
// 
// Возвращаемое значение:
//  ОбщийМодуль
Функция ТестируемыйМодуль() Экспорт

	Возврат ЖЧТ_Модули.РаботаСТипами();
	
КонецФункции

#КонецОбласти