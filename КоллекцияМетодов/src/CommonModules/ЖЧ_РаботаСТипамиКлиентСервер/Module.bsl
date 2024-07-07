// @strict-types

#Область ПрограммныйИнтерфейс

// Новый объект переданного типа.
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
//  
// Параметры:
//  Тип - Строка, Тип - Тип или имя типа
// 
// Возвращаемое значение:
//  Произвольный
Функция НовыйОбъект(Тип) Экспорт
	
	Типы = Неопределено;
	Если ТипЗнч(Тип) = Тип("Тип") Тогда
		Типы = Новый Массив; // Массив из Тип
		Типы.Добавить(Тип);
	Иначе
		Типы = Тип;
	КонецЕсли;
	
	ОписаниеТипа = Новый ОписаниеТипов(Типы);
	
	Возврат ОписаниеТипа.ПривестиЗначение();
	
КонецФункции

// Описание типов.
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
//  
// Параметры:
//  Тип - Строка, Тип, ОписаниеТипов, Неопределено - Тип(ы)
// 
// Возвращаемое значение:
//  ОписаниеТипов
Функция ОписаниеТипов(Тип) Экспорт
	
	Если Тип = Неопределено Тогда
		Возврат Новый ОписаниеТипов;
	ИначеЕсли ТипЗнч(Тип) = Тип("ОписаниеТипов") Тогда
		Возврат Тип;
	ИначеЕсли ТипЗнч(Тип) = Тип("Тип") Тогда
		Типы = Новый Массив(1);
		Типы[0] = Тип;
		Возврат Новый ОписаниеТипов(Типы);
	Иначе
		Возврат Новый ОписаниеТипов(Тип);
	КонецЕсли;
	
КонецФункции

// Массив.
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
//  
// Параметры:
//  Источник - Строка - Значения, разделенные запятыми или переносами строк
//           - Массив из Произвольный - Возвращаем как есть
//           - СписокЗначений из Произвольный - Возвращаем массив значений
//           - Неопределено - Возвращается неопределено 
//           - Произвольный - Массив с переданным значением
// 
// Возвращаемое значение:
//  - Массив из Произвольный 
//  - Неопределено
Функция Массив(Источник) Экспорт
	
	Если Источник = Неопределено Тогда
		Возврат Неопределено;	
	ИначеЕсли ТипЗнч(Источник) = Тип("Строка") Тогда
		Результат = СтрРазделить(Источник, "," + Символы.ПС, Ложь);
	ИначеЕсли ТипЗнч(Источник) = Тип("СписокЗначений") Тогда
		Результат = Источник.ВыгрузитьЗначения();
	ИначеЕсли ТипЗнч(Источник) = Тип("Массив") Тогда
		Результат = Источник;
	Иначе
		Результат = Новый Массив; // Массив из Неопределено
		Результат.Добавить(Источник);
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции

// Заполнить структуру рекурсивно.
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
//  
// Параметры:
//  Приемник - Структура
//  Источник - Структура
//  ИгнорироватьНеопределено - Булево - Игнорировать ли значение Неопределено из Источника
//  Дополнять - Булево - Нужно ли дополнять несуществующими в приемнике свойствами
Процедура ЗаполнитьСтруктуруРекурсивно(Приемник, Источник, ИгнорироватьНеопределено = Ложь, Дополнять = Ложь) Экспорт
	
	ТипСтруктура = Тип("Структура");
	Если ТипЗнч(Приемник) <> ТипСтруктура 
		ИЛИ ТипЗнч(Источник) <> ТипСтруктура Тогда
		Возврат;
	КонецЕсли;
	
	Для Каждого КлючИЗначение Из Источник Цикл
		
		ТекущийКлюч = КлючИЗначение.Ключ;
		ЗначениеИсточника = КлючИЗначение.Значение; // Структура, Произвольный
		ЗначениеПриемника = Неопределено; 
		Если Приемник.Свойство(ТекущийКлюч, ЗначениеПриемника) Тогда
			Если ТипЗнч(ЗначениеПриемника) = Тип("Структура") Тогда
				ЗаполнитьСтруктуруРекурсивно(ЗначениеПриемника, ЗначениеИсточника, ИгнорироватьНеопределено);
			ИначеЕсли ЗначениеИсточника = Неопределено И ИгнорироватьНеопределено Тогда
				Продолжить;
			Иначе
				Приемник[ТекущийКлюч] = ЗначениеИсточника;
			КонецЕсли;
		ИначеЕсли Дополнять Тогда
			Приемник.Вставить(ТекущийКлюч, ЗначениеИсточника);
		КонецЕсли;
		
	КонецЦикла;
	
КонецПроцедуры

// Значение соответствует шаблону.
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
//  
// Параметры:
//  Значение - Структура, Произвольный - Проверяемое значение
//  Шаблон - Структура - Шаблон структуры, наличия свойств которых нужно проверить в значении
// 
// Возвращаемое значение:
//  Булево
Функция ЗначениеСоответствуетШаблону(Значение, Шаблон) Экспорт
	
	Если ТипЗнч(Значение) = Тип("Структура") Тогда
		
		Соответствует = Истина;
		
		Если Шаблон.Количество() <> Значение.Количество() Тогда
			Соответствует = Ложь;
		Иначе
			Для Каждого КлючИЗначение Из Шаблон Цикл
				Если НЕ Значение.Свойство(КлючИЗначение.Ключ) Тогда
					Соответствует = Ложь;
					Прервать;
				КонецЕсли;
			КонецЦикла;
		КонецЕсли;
	
	Иначе
		
		Соответствует = Ложь;
		
	КонецЕсли;
	
	Возврат Соответствует;
	
КонецФункции

// Структура.
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
//  
// Параметры:
//  Источник - Структура
//  ИсключаяКлючи - см. Массив
//  ОставляяКлючи - см. Массив
//  ПоУмолчаниюИсключать - Булево - Стоит ли по умолчанию исключать все ключи, если пустой список исключений
// 
// Возвращаемое значение:
//  Структура
Функция Структура(Знач Источник, 
	Знач ИсключаяКлючи = Неопределено, Знач ОставляяКлючи = Неопределено, 
	Знач ПоУмолчаниюИсключать = Ложь) Экспорт
	
	ИсключаяКлючи = Массив(ИсключаяКлючи); // Массив из Строка
	ОставляяКлючи = Массив(ОставляяКлючи); // Массив из Строка
	
	ЕстьИсключения = ЗначениеЗаполнено(ИсключаяКлючи);
	ЕстьОставления = ЗначениеЗаполнено(ОставляяКлючи);
	
	Результат = Новый Структура;
	
	Для Каждого КлючИЗначение Из Источник Цикл
		
		Ключ = КлючИЗначение.Ключ;
		
		Исключить = ПоУмолчаниюИсключать И НЕ ЕстьИсключения;
		
		Если НЕ Исключить И ЕстьИсключения И ИсключаяКлючи.Найти(Ключ) <> Неопределено Тогда
			Исключить = Истина;
		КонецЕсли;
		
		Если Исключить И ЕстьОставления И ОставляяКлючи.Найти(Ключ) <> Неопределено Тогда
			Исключить = Ложь;
		КонецЕсли;
		
		Если НЕ Исключить Тогда
			Результат.Вставить(Ключ, КлючИЗначение.Значение);
		КонецЕсли;
		
	КонецЦикла;
	
	Возврат Результат;
	
КонецФункции

// Привести число.
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
//  
// Параметры:
//  Число - Число
//  МинимальноеЗначение - Число
//  МаксимальноеЗначение - Число
Процедура ПривестиЧисло(Число, 
	Знач МинимальноеЗначение = Неопределено, Знач МаксимальноеЗначение = Неопределено) Экспорт
	
	Если ТипЗнч(Число) <> Тип("Число")
		ИЛИ (МинимальноеЗначение <> Неопределено И Число < МинимальноеЗначение) Тогда
		Число = МинимальноеЗначение;
	ИначеЕсли МаксимальноеЗначение <> Неопределено И Число > МаксимальноеЗначение Тогда
		Число = МаксимальноеЗначение;
	КонецЕсли;
	
КонецПроцедуры

// Проверяет существование типа
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
//  
// Параметры:
//  ИмяТипа - Строка
// 
// Возвращаемое значение:
//  Булево - Тип существует
//
// @skip-check module-unused-local-variable
Функция ТипСуществует(ИмяТипа) Экспорт
	
	Попытка
		Тип = Тип(ИмяТипа);
		Возврат Истина;
	Исключение
		Возврат Ложь;
	КонецПопытки;
		
КонецФункции

// Это тип один из типов.
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
//  
// Параметры:
//  Тип - Тип - Проверяемый тип
//  Типы - Строка, Массив из Строка, Тип - Ожидаемые типы
// 
// Возвращаемое значение:
//  Булево
Функция ЭтоТипОдинИзТипов(Тип, Типы) Экспорт
	
	Результат = Ложь;
	
	//Формируем массив проверяемых типов
	Если ТипЗнч(Типы) = Тип("Строка") Тогда
		ПроверяемыеТипы	= СтрРазделить(Типы, ",", Ложь);
	ИначеЕсли ТипЗнч(Типы) = Тип("Массив") Тогда
		ПроверяемыеТипы	= Типы;
	ИначеЕсли ТипЗнч(Типы) = Тип("Тип") Тогда
		ПроверяемыеТипы	= Новый Массив; // Массив из Тип
		ПроверяемыеТипы.Добавить(Типы);
	КонецЕсли;
	
	//Пробегаем по каждому типу и проверяем	
	Для Каждого ПроверяемыйТипИлиИмя Из ПроверяемыеТипы Цикл
		
		Если ТипЗнч(ПроверяемыйТипИлиИмя) = Тип("Строка") Тогда
			ПроверяемыйТип = Тип(СокрЛП(ПроверяемыйТипИлиИмя));
		Иначе
			ПроверяемыйТип = ПроверяемыйТипИлиИмя;
		КонецЕсли;
		
		Если Тип = ПроверяемыйТип Тогда
			Результат = Истина;
			Прервать;
		КонецЕсли;
		
	КонецЦикла;
	
	Возврат Результат;
	
КонецФункции

// Имя свойства корректно.
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
//  
// Параметры:
//  ИмяСвойства - Строка - Проверяемое имя свойство
// 
// Возвращаемое значение:
//  Булево
Функция ИмяСвойстваКорректно(ИмяСвойства) Экспорт
	
	ВременнаяСтруктура = Новый Структура;
	Попытка
		ВременнаяСтруктура.Вставить(ИмяСвойства);
		Возврат Истина;
	Исключение
	    Возврат Ложь;
	КонецПопытки;
	
КонецФункции

// Пустые значения по описанию типов.
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
//  
// Параметры:
//  ОписаниеТипов - ОписаниеТипов
// 
// Возвращаемое значение:
//  Массив из Произвольный
Функция ПустыеЗначенияПоОписаниюТипов(ОписаниеТипов) Экспорт
	
	ТипыИзОписания = ОписаниеТипов.Типы();
	КоличествоТипов = ТипыИзОписания.Количество();
	
	ПустыеЗначения = Новый Массив(); //Массив из Неопределено
	Для Каждого ТипИзОписания Из ТипыИзОписания Цикл
		КоллекцияТипа = Новый Массив(1);
		КоллекцияТипа[0] = ТипИзОписания;
		ВременноеОписание = Новый ОписаниеТипов(КоллекцияТипа);
		ПустоеЗначение = ВременноеОписание.ПривестиЗначение();
		ПустыеЗначения.Добавить(ПустоеЗначение);
	КонецЦикла;
	
	Если КоличествоТипов > 1 Тогда
		ПустыеЗначения.Добавить(Неопределено);
	КонецЕсли;
	
	Возврат ПустыеЗначения;
	
КонецФункции

// Функция определяет существование метода объекта
// 
// Параметры:
//  Объект - Произвольный
//  ИмяМетода - Строка
// 
// Возвращаемое значение:
//  Булево - Существует ли метод объекта
Функция МетодСуществует(Объект, ИмяМетода) Экспорт
	
	ШаблонКода = "Объект.%1(,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,)";
	Алгоритм = СтрШаблон(ШаблонКода, ИмяМетода);
	
	Попытка
		//@skip-check server-execution-safe-mode, module-unused-local-variable
		НеобработанныйРезультат = Вычислить(Алгоритм);
	Исключение
		ИнформацияОбОшибке = ИнформацияОбОшибке();
		Если СтрНачинаетсяС(ИнформацияОбОшибке.Описание, "Значение не является значением объектного типа") Тогда
			Возврат Ложь;
		ИначеЕсли ИнформацияОбОшибке.Описание = "Слишком много фактических параметров" Тогда
			Возврат Истина;
		ИначеЕсли СтрНачинаетсяС(ИнформацияОбОшибке.Описание, "Обращение к процедуре объекта как к функции") Тогда
			Возврат Истина;
		ИначеЕсли СтрНачинаетсяС(ИнформацияОбОшибке.Описание, "Метод объекта не обнаружен") Тогда
			Возврат Ложь;
		Иначе
			НеобработанныйРезультат = ИнформацияОбОшибке.Описание;
		КонецЕсли;
	КонецПопытки;
	
	//На всякий случай
	ТекстИсключения = "Проверяемый метод ""%1"" объекта ""%2"" типа ""%3"" содержит неопределенное число параметров и не может быть проверен!
		|Результат выполнения: %4";
	ТекстИсключения = СтрШаблон(ТекстИсключения, ИмяМетода, Объект, ТипЗнч(Объект), НеобработанныйРезультат);
	ВызватьИсключение ТекстИсключения;
	
КонецФункции

#Если Сервер Тогда

// Имена свойств объекта метаданных.
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
// 
// Параметры:
//  ОбъектМетаданныхИлиПолноеИмя - ОбъектМетаданных, Строка - Объект метаданных
//  ПроверяемыеСвойства - Строка - Имена свойств через ","
// 
// Возвращаемое значение:
//  Массив из Строка
Функция ИменаСвойствОбъектаМетаданных(Знач ОбъектМетаданныхИлиПолноеИмя, Знач ПроверяемыеСвойства = "") Экспорт
	
	Если ТипЗнч(ОбъектМетаданныхИлиПолноеИмя) = Тип("Строка") Тогда
		ОбъектМетаданных = Метаданные.НайтиПоПолномуИмени(ОбъектМетаданныхИлиПолноеИмя);
	Иначе
		ОбъектМетаданных = ОбъектМетаданныхИлиПолноеИмя; // ОбъектМетаданных
	КонецЕсли;
	
	Если ПустаяСтрока(ПроверяемыеСвойства) Тогда
		ПроверяемыеСвойства = "Измерения,Ресурсы,Реквизиты,СтандартныеРеквизиты,ТабличныеЧасти";
	КонецЕсли;
	
	ИменаСвойств = Новый Массив; // Массив из Строка
	
	КоллекцииСвойств = Новый Структура(ПроверяемыеСвойства);
	ЗаполнитьЗначенияСвойств(КоллекцииСвойств, ОбъектМетаданных);
	
	Для Каждого КлючИЗначение Из КоллекцииСвойств Цикл
		КоллекцияСвойств = КлючИЗначение.Значение;
		Если КоллекцияСвойств <> Неопределено Тогда
			Для Каждого ТекущееСвойство Из КоллекцияСвойств Цикл // ОбъектМетаданных
				ИменаСвойств.Добавить(ТекущееСвойство.Имя);
			КонецЦикла;
		КонецЕсли;
	КонецЦикла;
	
	Возврат ИменаСвойств;
		
КонецФункции

// Является ли переданный тип менеджером записи регистра сведений
// К сожалению, либо этот вариант, либо тупо проврека представления типа
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS
// 
// Параметры:
//  ТипЗначения - Тип
//
// Возвращаемое значение:
//   Булево
Функция ЭтоМенеджерЗаписиРегистраСведений(ТипЗначения) Экспорт
    
    ОбъектМетаданных = Метаданные.НайтиПоТипу(ТипЗначения);
	Если ТипЗнч(ОбъектМетаданных) = Тип("ОбъектМетаданных") И Метаданные.РегистрыСведений.Содержит(ОбъектМетаданных) Тогда
		ТипМенеджераЗаписи = Тип("РегистрСведенийМенеджерЗаписи." + ОбъектМетаданных.Имя);
        ЭтоМенеджерЗаписи  = (ТипМенеджераЗаписи = ТипЗначения);
    Иначе
        ЭтоМенеджерЗаписи  = Ложь;
    КонецЕсли;
    
    Возврат ЭтоМенеджерЗаписи;
    
КонецФункции

// Возвращает описание таблицы значений по полному имени таблицы базы данных
// Например "Справочник.Валюты" или "РегистрСведений.КурсыВалют"
//
// Параметры:
//  ПолноеИмя  - Строка - Полное имя таблицы базы данных
//
// Возвращаемое значение:
//   ТаблицаЗначений
//
Функция СтруктураТаблицыБазы(ПолноеИмя) Экспорт
	
	ТекстЗапроса = СтрШаблон("ВЫБРАТЬ ПЕРВЫЕ 0 * ИЗ %1", ПолноеИмя);
	СхемаЗапроса = Новый СхемаЗапроса();
	СхемаЗапроса.УстановитьТекстЗапроса(ТекстЗапроса);
	
	Результат = Новый ТаблицаЗначений();
	Для Каждого Колонка Из СхемаЗапроса.ПакетЗапросов.Получить(0).Колонки Цикл
		
		ВременнаяСтруктура = Новый Структура("Колонки", Неопределено);
		ЗаполнитьЗначенияСвойств(ВременнаяСтруктура, Колонка);
		Если ЗначениеЗаполнено(ВременнаяСтруктура.Колонки) Тогда
			ТипЗначения = Новый ОписаниеТипов("ТаблицаЗначений");
		Иначе
			ТипЗначения = Колонка.ТипЗначения;
		КонецЕсли;
		
		Результат.Колонки.Добавить(Колонка.Псевдоним, ТипЗначения);
		
	КонецЦикла;
	
	Возврат Результат;
	
КонецФункции

#КонецЕсли

#КонецОбласти
