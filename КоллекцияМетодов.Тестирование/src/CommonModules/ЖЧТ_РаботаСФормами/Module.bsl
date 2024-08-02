
#Область СлужебныйПрограммныйИнтерфейс

// Регистрация тестов
Процедура ИсполняемыеСценарии() Экспорт

	Перем ЮТТесты;
	ЮТТесты = ЖЧТ_Движок.ЮТТесты();
	
	ЮТТесты
		.ДобавитьТестовыйНабор("ОтключитьСохранениеНастроекСпискаПриОткрытииВОкне")
			.ДобавитьКлиентскийТест("Тест_ОтключитьСохранениеНастроекСпискаПриОткрытииВОкне")
		.ДобавитьТестовыйНабор("СтруктураИзПараметровФормы")
			.ДобавитьКлиентскийТест("Тест_СтруктураИзПараметровФормы")
		.ДобавитьТестовыйНабор("НовыйЭлементУсловногоОформления")
			.ДобавитьКлиентскийТест("Тест_НовыйЭлементУсловногоОформления")
		.ДобавитьТестовыйНабор("ОбновитьПризнакПредупрежденияПриРедактированииЭлемента")
			//Клиентский тест вызовет однотипный серверный тест с передачей формы
			.ДобавитьКлиентскийТест("Тест_ОбновитьПризнакПредупрежденияПриРедактированииЭлементаНаКлиенте")
		.ДобавитьТестовыйНабор("ТекущиеДанныеТаблицы")
			//Клиентский тест вызовет однотипный серверный тест с передачей формы
			.ДобавитьКлиентскийТест("Тест_ТекущиеДанныеТаблицыНаКлиенте")
		.ДобавитьТестовыйНабор("ОткрытыеФормыПоИмени")
			.ДобавитьКлиентскийТест("Тест_ОткрытыеФормыПоИмени")
	;

КонецПроцедуры

#Область Тесты

#Область ОтключитьСохранениеНастроекСпискаПриОткрытииВОкне

Процедура Тест_ОтключитьСохранениеНастроекСпискаПриОткрытииВОкне() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	ИмяСписка = "Списочек";
	
	МокФормы = Новый Структура();
	МокФормы.Вставить("Окно", Неопределено);
	МокФормы.Вставить("Списочек", Новый Структура);
	МокФормы.Списочек.Вставить("АвтоматическоеСохранениеПользовательскихНастроек", Истина);
	
	ТестируемыйМодуль.ОтключитьСохранениеНастроекСпискаПриОткрытииВОкне(МокФормы, "Списочек");
	ЮТест.ОжидаетЧто(МокФормы.Списочек.АвтоматическоеСохранениеПользовательскихНастроек).ЭтоИстина();
	
	МокФормы.Окно = Новый Структура;
	ТестируемыйМодуль.ОтключитьСохранениеНастроекСпискаПриОткрытииВОкне(МокФормы, "Списочек");
	ЮТест.ОжидаетЧто(МокФормы.Списочек.АвтоматическоеСохранениеПользовательскихНастроек).ЭтоЛожь();
	
КонецПроцедуры

#КонецОбласти

#Область СтруктураИзПараметровФормы

#Если Клиент Тогда

Процедура Тест_СтруктураИзПараметровФормы() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Ожидаемый = Новый Структура;
	Ожидаемый.Вставить("Число", ЖЧТ_Общее.СлучайноеЧисло(1, 999));
	Ожидаемый.Вставить("Строка", ЖЧТ_Общее.СлучайныйКлюч());
	Ожидаемый.Вставить("Булево", Булево(ЖЧТ_Общее.СлучайноеЧисло(0, 1)));
	Ожидаемый.Вставить("Дата", ТекущаяДата());
	Ожидаемый.Вставить("Произвольный", Новый Структура);
	ИмяКлюча = ЖЧТ_Общее.СлучайныйКлюч();
	Ожидаемый.Произвольный.Вставить(ИмяКлюча, Новый УникальныйИдентификатор());
	
	Форма = ПолучитьФорму("ОбщаяФорма.ЖЧТ_РаботаСФормами", Ожидаемый);
	
	Результат = ТестируемыйМодуль.СтруктураИзПараметровФормы(Форма.Параметры);
	
	ЮТест.ОжидаетЧто(Результат)
		.ИмеетТип("Структура")
		.Свойство("Число").Равно(Ожидаемый.Число)
		.Свойство("Строка").Равно(Ожидаемый.Строка)
		.Свойство("Булево").Равно(Ожидаемый.Булево)
		.Свойство("Дата").Равно(Ожидаемый.Дата)
		.Свойство("Произвольный." + ИмяКлюча).Равно(Ожидаемый.Произвольный[ИмяКлюча])
		;
	
КонецПроцедуры

#КонецЕсли

#КонецОбласти

#Область НовыйЭлементУсловногоОформления

Процедура Тест_НовыйЭлементУсловногоОформления() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	УсловноеОформление = ЖЧТ_Модули.РаботаСТипами().НовыйОбъект("УсловноеОформлениеКомпоновкиДанных");
	ЮТест.ОжидаетЧто(УсловноеОформление).ИмеетТип("УсловноеОформлениеКомпоновкиДанных");
	
	ОформляемыеПоля = Новый Массив;
	ОформляемыеПоля.Добавить(ЖЧТ_Общее.СлучайныйКлюч());
	ОформляемыеПоля.Добавить(ЖЧТ_Общее.СлучайныйКлюч());
	ОформляемыеПоля.Добавить(ЖЧТ_Общее.СлучайныйКлюч());
	
	УсловияОтбора = Новый Структура;
	УсловияОтбора.Вставить("ЛевоеЗначение", Новый ПолеКомпоновкиДанных(ЖЧТ_Общее.СлучайныйКлюч()));
	УсловияОтбора.Вставить("ПравоеЗначение", ЖЧТ_Общее.СлучайныйКлюч());
		
	ПараметрыОформления = Новый Структура("Текст", ЖЧТ_Общее.СлучайныйКлюч());
	
	Результат = ТестируемыйМодуль.НовыйЭлементУсловногоОформления(УсловноеОформление, 
		ОформляемыеПоля, УсловияОтбора, ПараметрыОформления); // ЭлементУсловногоОформленияКомпоновкиДанных
		
	ЮТест.ОжидаетЧто(Результат).ИмеетТип("ЭлементУсловногоОформленияКомпоновкиДанных");
	
	ЮТест.ОжидаетЧто(Результат.Поля.Элементы.Количество()).Равно(ОформляемыеПоля.Количество());
	Для Каждого Поле Из Результат.Поля.Элементы Цикл
		ИмяПоля = Строка(Поле.Поле);
		ЮТест.ОжидаетЧто(ОформляемыеПоля.Найти(ИмяПоля)).ЭтоНеНеопределено();
	КонецЦикла;
	
	ЮТест.ОжидаетЧто(Результат.Отбор.Элементы.Количество()).Равно(1);
	ЮТест.ОжидаетЧто(Результат.Отбор.Элементы[0])
		.Свойство("ЛевоеЗначение").Равно(УсловияОтбора.ЛевоеЗначение)
		.Свойство("ПравоеЗначение").Равно(УсловияОтбора.ПравоеЗначение)
		.Свойство("Использование").ЭтоИстина()
	;
	
	Для Каждого Оформление Из Результат.Оформление.Элементы Цикл
		
		ИмяКлюча = Строка(Оформление.Параметр);
		Значение = Неопределено;
		Если ПараметрыОформления.Свойство(ИмяКлюча, Значение) Тогда
			ЮТест.ОжидаетЧто(Оформление.Использование).ЭтоИстина();
			ЮТест.ОжидаетЧто(Оформление.Значение).Равно(Значение);
		КонецЕсли;
		
	КонецЦикла;
	
КонецПроцедуры

#КонецОбласти

#Область ОбновитьПризнакПредупрежденияПриРедактированииЭлемента

#Если Клиент Тогда

// Тест обновить признак предупреждения при редактировании элемента.
Процедура Тест_ОбновитьПризнакПредупрежденияПриРедактированииЭлементаНаКлиенте() Экспорт
	
	Форма = ПолучитьФорму("ОбщаяФорма.ЖЧТ_РаботаСФормами");
	
	Тест_ОбновитьПризнакПредупрежденияПриРедактированииЭлемента(Форма);
	
	Форма.ВыполнитьМетод("ЖЧТ_РаботаСФормами.Тест_ОбновитьПризнакПредупрежденияПриРедактированииЭлемента(ЭтотОбъект);");
	
КонецПроцедуры

#КонецЕсли

// Тест обновить признак предупреждения при редактировании элемента.
// 
Процедура Тест_ОбновитьПризнакПредупрежденияПриРедактированииЭлемента(Форма) Экспорт
	
	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	ПроверяемыеДанные = "РеквизитЧисло,РеквизитСтрока";
	ЭлементФормы = Форма.Элементы.РеквизитДата;
	
	//Пустые данные
	Форма.РеквизитЧисло = 0;
	Форма.РеквизитСтрока = "";
	ТестируемыйМодуль.ОбновитьПризнакПредупрежденияПриРедактированииЭлемента(
		Форма, ЭлементФормы.Имя, ПроверяемыеДанные);
	ЮТест.ОжидаетЧто(ЭлементФормы.ОтображениеПредупрежденияПриРедактировании)
		.Равно(ОтображениеПредупрежденияПриРедактировании.НеОтображать);
	
	//Число заполнено
	Форма.РеквизитЧисло = ЖЧТ_Общее.СлучайноеЧисло();
	ТестируемыйМодуль.ОбновитьПризнакПредупрежденияПриРедактированииЭлемента(
		Форма, ЭлементФормы.Имя, ПроверяемыеДанные);
	ЮТест.ОжидаетЧто(ЭлементФормы.ОтображениеПредупрежденияПриРедактировании)
		.Равно(ОтображениеПредупрежденияПриРедактировании.Отображать);
	
	//Число и строка заполнены
	Форма.РеквизитСтрока = ЖЧТ_Общее.СлучайныйКлюч();
	ТестируемыйМодуль.ОбновитьПризнакПредупрежденияПриРедактированииЭлемента(
		Форма, ЭлементФормы.Имя, ПроверяемыеДанные);
	ЮТест.ОжидаетЧто(ЭлементФормы.ОтображениеПредупрежденияПриРедактировании)
		.Равно(ОтображениеПредупрежденияПриРедактировании.Отображать);
	
	//Строка заполнена
	Форма.РеквизитЧисло = 0;
	ТестируемыйМодуль.ОбновитьПризнакПредупрежденияПриРедактированииЭлемента(
		Форма, ЭлементФормы.Имя, ПроверяемыеДанные);
	ЮТест.ОжидаетЧто(ЭлементФормы.ОтображениеПредупрежденияПриРедактировании)
		.Равно(ОтображениеПредупрежденияПриРедактировании.Отображать);
	
	//Пустые данные
	Форма.РеквизитЧисло = 0;
	Форма.РеквизитСтрока = "";
	ТестируемыйМодуль.ОбновитьПризнакПредупрежденияПриРедактированииЭлемента(
		Форма, ЭлементФормы.Имя, ПроверяемыеДанные);
	ЮТест.ОжидаетЧто(ЭлементФормы.ОтображениеПредупрежденияПриРедактировании)
		.Равно(ОтображениеПредупрежденияПриРедактировании.НеОтображать);
	
КонецПроцедуры

#КонецОбласти

#Область ТекущиеДанныеТаблицы

#Если Клиент Тогда

// Тест текущие данные таблицы.
Процедура Тест_ТекущиеДанныеТаблицыНаКлиенте() Экспорт
	
	Форма = ПолучитьФорму("ОбщаяФорма.ЖЧТ_РаботаСФормами");
	
	Тест_ОбновитьПризнакПредупрежденияПриРедактированииЭлемента(Форма);
	
	Форма.ВыполнитьМетод("ЖЧТ_РаботаСФормами.Тест_ТекущиеДанныеТаблицы(ЭтотОбъект);");
	
КонецПроцедуры

#КонецЕсли

// Тест текущие данные таблицы.
// 
// Параметры:
//  Форма - см. ОбщаяФорма.ЖЧТ_РаботаСФормами
Процедура Тест_ТекущиеДанныеТаблицы(Форма) Экспорт
	
	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Форма.ТаблицаФормы.Очистить();
	ЧислоСтрок = ЖЧТ_Общее.СлучайноеЧисло(2, 10);
	ТекущаяСтрока = Неопределено;
	НомерТекущейСтроки = ЖЧТ_Общее.СлучайноеЧисло(1, ЧислоСтрок);
	Для Номер = 1 По ЧислоСтрок Цикл
		НоваяСтрока = Форма.ТаблицаФормы.Добавить();
		Если Номер = НомерТекущейСтроки Тогда
			ТекущаяСтрока = НоваяСтрока;
		КонецЕсли;
	КонецЦикла;
	
	ЭлементФормы = Форма.Элементы.ТаблицаФормы;
	ЭлементФормы.ТекущаяСтрока = ТекущаяСтрока.ПолучитьИдентификатор();
	
	Результат = ТестируемыйМодуль.ТекущиеДанныеТаблицы(Форма, ЭлементФормы.Имя);
	
	ЮТест.ОжидаетЧто(Результат).Равно(ТекущаяСтрока);
	
КонецПроцедуры


#КонецОбласти

#Область ОткрытаяФормаПоИмени

#Если Клиент Тогда

Процедура Тест_ОткрытыеФормыПоИмени() Экспорт
	
	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	ИмяФормы = "ОбщаяФорма.ЖЧТ_РаботаСФормами";
	
	//Закроем ранее открытые формы по имени
	ОткрытыеФормы = ТестируемыйМодуль.ОткрытыеФормыПоИмени(ИмяФормы);
	Для Каждого ОткрытаяФорма Из ОткрытыеФормы Цикл
		ОткрытаяФорма.Закрыть();
	КонецЦикла;
	
	//Нет открытой формы
	Результат = ТестируемыйМодуль.ОткрытаяФормаПоИмени(ИмяФормы);
	ЮТест.ОжидаетЧто(Результат).ЭтоНеопределено();
	
	Результат = ТестируемыйМодуль.ОткрытыеФормыПоИмени(ИмяФормы);
	ЮТест.ОжидаетЧто(Результат).ИмеетДлину(0);
	
	//Открываем первую форму
	ОткрытаяФорма1 = ОткрытьФорму(ИмяФормы,,,Новый УникальныйИдентификатор());
	
	Результат = ТестируемыйМодуль.ОткрытаяФормаПоИмени(ИмяФормы);
	ЮТест.ОжидаетЧто(Результат).Равно(ОткрытаяФорма1);
	
	Результат = ТестируемыйМодуль.ОткрытыеФормыПоИмени(ИмяФормы);
	ЮТест.ОжидаетЧто(Результат)
		.ИмеетДлину(1)
		.Содержит(ОткрытаяФорма1);
	
	//Открываем вторую форму
	ОткрытаяФорма2 = ОткрытьФорму(ИмяФормы,,,Новый УникальныйИдентификатор());
	
	Результат = ТестируемыйМодуль.ОткрытаяФормаПоИмени(ИмяФормы);
	ЮТест.ОжидаетЧто(Результат = ОткрытаяФорма1 ИЛИ Результат = ОткрытаяФорма2).ЭтоИстина();
	
	Результат = ТестируемыйМодуль.ОткрытыеФормыПоИмени(ИмяФормы);
	ЮТест.ОжидаетЧто(Результат)
		.ИмеетДлину(2)
		.Содержит(ОткрытаяФорма1)
		.Содержит(ОткрытаяФорма2);
	
	//Закрываем первую форму
	ОткрытаяФорма1.Закрыть();
	
	Результат = ТестируемыйМодуль.ОткрытаяФормаПоИмени(ИмяФормы);
	ЮТест.ОжидаетЧто(Результат).Равно(ОткрытаяФорма2);
	
	Результат = ТестируемыйМодуль.ОткрытыеФормыПоИмени(ИмяФормы);
	ЮТест.ОжидаетЧто(Результат)
		.ИмеетДлину(1)
		.Содержит(ОткрытаяФорма2);
	
	//Закрываем вторую форму
	ОткрытаяФорма2.Закрыть();
	
	Результат = ТестируемыйМодуль.ОткрытаяФормаПоИмени(ИмяФормы);
	ЮТест.ОжидаетЧто(Результат).ЭтоНеопределено();
	
	Результат = ТестируемыйМодуль.ОткрытыеФормыПоИмени(ИмяФормы);
	ЮТест.ОжидаетЧто(Результат).ИмеетДлину(0);
	
КонецПроцедуры

#КонецЕсли

#КонецОбласти

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Тестируемый модуль.
// 
// Возвращаемое значение:
//  ОбщийМодуль
Функция ТестируемыйМодуль() Экспорт

	Возврат ЖЧТ_Модули.РаботаСФормами();
	
КонецФункции

#КонецОбласти