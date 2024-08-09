// @strict-types

#Область ПрограммныйИнтерфейс

// Возвращает новый объект переданного типа.
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS/issues/20
//  
// Параметры:
//  Тип - Строка, Тип - Тип или имя типа
// 
// Возвращаемое значение:
//  Произвольный
//
// Примеры:
// 	Результат = НовыйОбъект("Структура");
// 	Результат = НовыйОбъект("УсловноеОформлениеКомпоновкиДанных");
// 	Результат = НовыйОбъект("HTTPОтвет");
//
Функция НовыйОбъект(Знач Тип) Экспорт
	
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

// Новый объект ОписаниеТипов.
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS/issues/39
//  
// Параметры:
//  Тип - Строка, Тип, ОписаниеТипов, Неопределено - Тип(ы)
// 
// Возвращаемое значение:
//  ОписаниеТипов
//
// Пример:
//  Результат = ОписаниеТипов("Строка");
//  Результат = ОписаниеТипов(Тип("Строка"));
//
Функция ОписаниеТипов(Знач Тип) Экспорт
	
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

// Новый объект Массив.
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS/issues/41
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
//
// Пример:
//  Массив = Массив(1); //1
//  
//  Массив = Массив("а,б,в"); //"а", "б", "в"
//  
//  СписокЗначений = Новый СписокЗначений;
//  СписокЗначений.ЗагрузитьЗначения(Массив);
//  Массив = Массив(СписокЗначений); //"а", "б", "в"
//
Функция Массив(Знач Источник) Экспорт
	
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
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS/issues/43
//  
// Параметры:
//  Приемник - Структура
//  Источник - Структура
//  ИгнорироватьНеопределено - Булево - Игнорировать ли значение Неопределено из Источника
//  Дополнять - Булево - Нужно ли дополнять несуществующими в приемнике свойствами
//    
Процедура ЗаполнитьСтруктуруРекурсивно(Знач Приемник, Знач Источник, 
	Знач ИгнорироватьНеопределено = Ложь, Знач Дополнять = Ложь) Экспорт
	
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

// Проверяет соответствие значения шаблону.
// Содержит ли значнеие свойства шаблона.
// Позволяет "интерфейс" структуры
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS/issues/38
//  
// Параметры:
//  Значение - Структура, Произвольный - Проверяемое значение
//  Шаблон - Структура - Шаблон структуры, наличия свойств которых нужно проверить в значении
// 
// Возвращаемое значение:
//  Булево
Функция ЗначениеСоответствуетШаблону(Знач Значение, Знач Шаблон) Экспорт
	
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

// Возвращает новую структуру на основе параметров.
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS/issues/42
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

// Приводит число к нужному диапазону.
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS/issues/40
//  
// Параметры:
//  Число - Число
//  МинимальноеЗначение - Число
//  МаксимальноеЗначение - Число
//  
// Пример:
//  ПривестиЧисло(1, -1, 2) //1
//  ПривестиЧисло(1, 2, 3)  //2
//  ПривестиЧисло(5, 2, 3)  //3
//  
Процедура ПривестиЧисло(Число, 
	Знач МинимальноеЗначение = Неопределено, Знач МаксимальноеЗначение = Неопределено) Экспорт
	
	Если ТипЗнч(Число) <> Тип("Число")
		ИЛИ (МинимальноеЗначение <> Неопределено И Число < МинимальноеЗначение) Тогда
		Число = МинимальноеЗначение;
	ИначеЕсли МаксимальноеЗначение <> Неопределено И Число > МаксимальноеЗначение Тогда
		Число = МаксимальноеЗначение;
	КонецЕсли;
	
КонецПроцедуры

// Проверяет существование типа (упрощает разработку инструмента с поддержкой старых платформ)
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS/issues/57
//  
// Параметры:
//  ИмяТипа - Строка
// 
// Возвращаемое значение:
//  Булево - Тип существует
//
// @skip-check module-unused-local-variable
Функция ТипСуществует(Знач ИмяТипа) Экспорт
	
	Попытка
		Тип = Тип(ИмяТипа);
		Возврат Истина;
	Исключение
		Возврат Ложь;
	КонецПопытки;
		
КонецФункции

// Является ли проверяемый тип одним из переданных типов.
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS/issues/87
//  
// Параметры:
//  Тип - Тип - Проверяемый тип
//  Типы - Строка, Массив из Строка, Тип - Ожидаемые типы
// 
// Возвращаемое значение:
//  Булево
//
// Пример:
// 	ЭтоТипОдинИзТипов("Число", "Число,Строка")  //Истина
// 	ЭтоТипОдинИзТипов("Число", "Строка,Булево") //Ложь
//
Функция ЭтоТипОдинИзТипов(Знач Тип, Знач Типы) Экспорт
	
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

// Является ли переданная строка корректным в качестве имени переменной или свойства объекта.
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS/issues/65
//  
// Параметры:
//  ИмяСвойства - Строка - Проверяемое имя свойство
// 
// Возвращаемое значение:
//  Булево
//  
// Пример:
//  ИмяСвойстваКорректно("П1") //Истина
//  ИмяСвойстваКорректно("_1") //Истина
//  ИмяСвойстваКорректно("1")  //Ложь
//  ИмяСвойстваКорректно(",?") //Ложь
//  
Функция ИмяСвойстваКорректно(Знач ИмяСвойства) Экспорт
	
	ВременнаяСтруктура = Новый Структура;
	Попытка
		ВременнаяСтруктура.Вставить(ИмяСвойства);
		Возврат Истина;
	Исключение
	    Возврат Ложь;
	КонецПопытки;
	
КонецФункции

// Все возможные пустые значения на основе описания типов.
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS/issues/68
//  
// Параметры:
//  ОписаниеТипов - ОписаниеТипов
// 
// Возвращаемое значение:
//  Массив из Произвольный
//  
Функция ПустыеЗначенияПоОписаниюТипов(Знач ОписаниеТипов) Экспорт
	
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
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS/issues/56
// 
// Параметры:
//  Объект - Произвольный
//  ИмяМетода - Строка
// 
// Возвращаемое значение:
//  Булево - Существует ли метод объекта
Функция МетодСуществует(Знач Объект, Знач ИмяМетода) Экспорт
	
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

// Это тип, который не имеет свойств и не может быть использовать в методе ЗаполнитьЗначенияСвойств().
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS/issues/145
// 
// Параметры:
//  Тип - Тип
// 
// Возвращаемое значение:
//  Булево
//  
// Пример:
//  ЭтоТипБезСвойств(Тип("Булево")) // Истина
//  ЭтоТипБезСвойств(Тип("Структура")) // Ложь
//  
Функция ЭтоТипБезСвойств(Тип) Экспорт
	
	Возврат Тип = Тип("Неопределено") 
		ИЛИ Тип = Тип("Булево") 
		ИЛИ Тип = Тип("Дата") 
		ИЛИ Тип = Тип("Строка")
		ИЛИ Тип = Тип("Null");
	
КонецФункции

#Если Сервер Тогда

// Имена свойств объекта метаданных.
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS/issues/70
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
		ПроверяемыеСвойства = "Измерения,Ресурсы,Реквизиты,СтандартныеРеквизиты,ТабличныеЧасти,СтандартныеТабличныеЧасти,ОбщиеРеквизиты";
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
	
	Если КоллекцииСвойств.Свойство("ОбщиеРеквизиты") Тогда
	
		Для каждого ОбщийРеквизит Из Метаданные.ОбщиеРеквизиты Цикл
			Если ОбщийРеквизит.РазделениеДанных = Метаданные.СвойстваОбъектов.РазделениеДанныхОбщегоРеквизита.Разделять Тогда
				Продолжить;
			КонецЕсли;
			ИспользованиеПоУмолчанию = (ОбщийРеквизит.АвтоИспользование = Метаданные.СвойстваОбъектов.АвтоИспользованиеОбщегоРеквизита.Использовать);
			ОбъектВСоставе = ОбщийРеквизит.Состав.Найти(ОбъектМетаданных);
			Если ОбъектВСоставе = Неопределено Тогда
				ИспользованиеДляОбъекта = ИспользованиеПоУмолчанию;
			ИначеЕсли ОбъектВСоставе.Использование = Метаданные.СвойстваОбъектов.ИспользованиеОбщегоРеквизита.Использовать Тогда
				ИспользованиеДляОбъекта = Истина;
			ИначеЕсли ОбъектВСоставе.Использование = Метаданные.СвойстваОбъектов.ИспользованиеОбщегоРеквизита.НеИспользовать Тогда
				ИспользованиеДляОбъекта = Ложь;
			Иначе
				ИспользованиеДляОбъекта = ИспользованиеПоУмолчанию;
			КонецЕсли;
			Если ИспользованиеДляОбъекта Тогда
				ИменаСвойств.Добавить(ОбщийРеквизит.Имя);
			КонецЕсли;
		КонецЦикла;
		
	КонецЕсли;
	
	Возврат ИменаСвойств;
		
КонецФункции

// Является ли переданный тип менеджером записи регистра сведений
// К сожалению, либо этот вариант, либо тупо проверка представления типа
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS/issues/25
// 
// Параметры:
//  ТипЗначения - Тип
//
// Возвращаемое значение:
//   Булево
Функция ЭтоМенеджерЗаписиРегистраСведений(Знач ТипЗначения) Экспорт
    
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
// Источник: https://github.com/SeiOkami/CollectionMethodsOneS/issues/21
//
// Параметры:
//  ПолноеИмя  - Строка - Полное имя таблицы базы данных
//
// Возвращаемое значение:
//   ТаблицаЗначений
//
Функция СтруктураТаблицыБазы(Знач ПолноеИмя) Экспорт
	
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
