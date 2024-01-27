
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

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Тестируемый модуль.
// 
// Возвращаемое значение:
//  ОбщийМодуль
Функция ТестируемыйМодуль() Экспорт

	Возврат ЖЧТ_Модули.РаботаСТипамиКлиентСервер();
	
КонецФункции

#КонецОбласти