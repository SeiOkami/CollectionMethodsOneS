
#Область СлужебныйПрограммныйИнтерфейс

// Регистрация тестов
Процедура ИсполняемыеСценарии() Экспорт

	Перем ЮТТесты;
	ЮТТесты = ЖЧТ_Движок.ЮТТесты();
	
	ЮТТесты
		.ДобавитьТестовыйНабор("ВставитьПараметрыВСтроку")
			.ДобавитьТест("Тест_ВставитьПараметрыВСтроку_ПараметрыВнутри", "Параметры внутри шаблона строки")
			.ДобавитьТест("Тест_ВставитьПараметрыВСтроку_ПараметрВНачале", "Параметр сразу в начале шаблона")
			.ДобавитьТест("Тест_ВставитьПараметрыВСтроку_ПараметрВКонце", "Параметр в конце шаблона")
			.ДобавитьТест("Тест_ВставитьПараметрыВСтроку_ТолькоПараметр", "В шаблоне только параметр")
			.ДобавитьТест("Тест_ВставитьПараметрыВСтроку_Ошибка_НетСвойства", "Ошибка, если нет свойства")
			.ДобавитьТест("Тест_ВставитьПараметрыВСтроку_Ошибка_НомерныеПараметры", "Ошибка, если передано %N")
			.ДобавитьТест("Тест_ВставитьПараметрыВСтроку_Ошибка_НеверныйФормат", "Ошибка, если передано %%")
		.ДобавитьТестовыйНабор("СтрокаВыделеннаяОформлением")
			.ДобавитьТест("Тест_СтрокаВыделеннаяОформлением_Начало", "Выделено первое слово")
			.ДобавитьТест("Тест_СтрокаВыделеннаяОформлением_Середина", "Выделено среднее слово")
			.ДобавитьТест("Тест_СтрокаВыделеннаяОформлением_Конец", "Выделено последнее слово")
			.ДобавитьТест("Тест_СтрокаВыделеннаяОформлением_Множество", "Выделено множество букв внутри строки")
		.ДобавитьТестовыйНабор("СтрокаНайтиИВыделитьОформлением")
			.ДобавитьТест("Тест_СтрокаНайтиИВыделитьОформлением")
				.СПараметрами("Привет", "1", Неопределено)
				.СПараметрами("Привет", "ив", "Пр`ив`ет")
				.СПараметрами("CNT-00230", "23", "CNT-00`23`0")
				.СПараметрами("CNT-00230", "0", "CNT-`00`23`0`")
	;

КонецПроцедуры

#Область Тесты

#Область ВставитьПараметрыВСтроку

Процедура Тест_ВставитьПараметрыВСтроку_ПараметрыВнутри() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	ШаблонСтроки = "Привет, %Фамилия% %Имя% %Отчество% !";
	ЗначенияСтроки = Новый Структура("Фамилия,Имя,Отчество", "Иванов", "Иван", "Иванович");
	
	Результат = ТестируемыйМодуль.ВставитьПараметрыВСтроку(ШаблонСтроки, ЗначенияСтроки);
	
	ЮТест.ОжидаетЧто(Результат).Равно("Привет, Иванов Иван Иванович !");
	
КонецПроцедуры

Процедура Тест_ВставитьПараметрыВСтроку_ПараметрВНачале() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	ШаблонСтроки = "%Свойство% = %Значение% !";
	ЗначенияСтроки = Новый Структура("Свойство,Значение", "Сумма", 100);

	Результат = ТестируемыйМодуль.ВставитьПараметрыВСтроку(ШаблонСтроки, ЗначенияСтроки);
	
	ЮТест.ОжидаетЧто(Результат).Равно("Сумма = 100 !");
	
КонецПроцедуры

Процедура Тест_ВставитьПараметрыВСтроку_ПараметрВКонце() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	ШаблонСтроки = "Мое значение: %Значение%";
	ЗначенияСтроки = Новый Структура("Значение", 1);

	Результат = ТестируемыйМодуль.ВставитьПараметрыВСтроку(ШаблонСтроки, ЗначенияСтроки);
	
	ЮТест.ОжидаетЧто(Результат).Равно("Мое значение: 1");
	
КонецПроцедуры

Процедура Тест_ВставитьПараметрыВСтроку_ТолькоПараметр() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	ШаблонСтроки = "%Значение%";
	ЗначенияСтроки = Новый Структура("Значение", 1);

	Результат = ТестируемыйМодуль.ВставитьПараметрыВСтроку(ШаблонСтроки, ЗначенияСтроки);
	
	ЮТест.ОжидаетЧто(Результат).Равно("1");
	
КонецПроцедуры

Процедура Тест_ВставитьПараметрыВСтроку_Ошибка_НетСвойства() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	ШаблонСтроки = "У меня нет %Свойство1% !";
	ЗначенияСтроки = Новый Структура("Свойство2");

	ИмяМетода = "ВставитьПараметрыВСтроку";
	ПараметрыМетода = ЖЧТ_Движок.ЮТОбщий().ЗначениеВМассиве(ШаблонСтроки, ЗначенияСтроки);
	
	ЮТест.ОжидаетЧто(ТестируемыйМодуль)
		.Метод(ИмяМетода, ПараметрыМетода)
		.ВыбрасываетИсключение("Поле объекта не обнаружено (Свойство1)");
	
КонецПроцедуры

Процедура Тест_ВставитьПараметрыВСтроку_Ошибка_НомерныеПараметры() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	ШаблонСтроки = "Текст с параметром %1!";
	ЗначенияСтроки = Новый Структура("С");

	ИмяМетода = "ВставитьПараметрыВСтроку";
	ПараметрыМетода = ЖЧТ_Движок.ЮТОбщий().ЗначениеВМассиве(ШаблонСтроки, ЗначенияСтроки);
	
	ЮТест.ОжидаетЧто(ТестируемыйМодуль)
		.Метод(ИмяМетода, ПараметрыМетода)
		.ВыбрасываетИсключение("Поле объекта не обнаружено (1!)");
	
КонецПроцедуры

Процедура Тест_ВставитьПараметрыВСтроку_Ошибка_НеверныйФормат() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	ШаблонСтроки = "Неверный формат %% !";
	ЗначенияСтроки = Новый Структура("С");

	ИмяМетода = "ВставитьПараметрыВСтроку";
	ПараметрыМетода = ЖЧТ_Движок.ЮТОбщий().ЗначениеВМассиве(ШаблонСтроки, ЗначенияСтроки);
	
	ЮТест.ОжидаетЧто(ТестируемыйМодуль)
		.Метод(ИмяМетода, ПараметрыМетода)
		.ВыбрасываетИсключение("Поле объекта не обнаружено");
	
КонецПроцедуры

#КонецОбласти

#Область СтрокаВыделеннаяОформлением

Процедура Тест_СтрокаВыделеннаяОформлением_Начало() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Строка = "`Выделено` первое слово";
	Эталон = Новый ФорматированнаяСтрока(
		СтрНайтиИВыделитьОформлением("Выделено", "Выделено"),
		" первое слово");
		
	Результат = ТестируемыйМодуль.СтрокаВыделеннаяОформлением(Строка);
	
	ЮТест.ОжидаетЧто(Результат).Равно(Эталон);
	
КонецПроцедуры

Процедура Тест_СтрокаВыделеннаяОформлением_Середина() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Строка = "Выделено `среднее` слово";
	Эталон = Новый ФорматированнаяСтрока(
		"Выделено ", 
		СтрНайтиИВыделитьОформлением("среднее", "среднее"),
		" слово");
		
	Результат = ТестируемыйМодуль.СтрокаВыделеннаяОформлением(Строка);
	
	ЮТест.ОжидаетЧто(Результат).Равно(Эталон);
	
КонецПроцедуры

Процедура Тест_СтрокаВыделеннаяОформлением_Конец() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Строка = "Выделено последнее `слово`";
	Эталон = Новый ФорматированнаяСтрока(
		"Выделено последнее ", 
		СтрНайтиИВыделитьОформлением("слово", "слово"));
		
	Результат = ТестируемыйМодуль.СтрокаВыделеннаяОформлением(Строка);
	
	ЮТест.ОжидаетЧто(Результат).Равно(Эталон);
	
КонецПроцедуры

Процедура Тест_СтрокаВыделеннаяОформлением_Множество() Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Е = СтрНайтиИВыделитьОформлением("е", "е");
	О = СтрНайтиИВыделитьОформлением("о", "о");
	
	Строка = "В эт`о`й стр`о`к`е` выд`е`л`е`ны вс`е` буквы `е` и `о`";
	Эталон = Новый ФорматированнаяСтрока(
		"В эт", О, "й стр", О, "к", Е, " выд", Е, "л", Е, "ны вс", Е, " буквы ", Е, " и ", О
	);
	
	Результат = ТестируемыйМодуль.СтрокаВыделеннаяОформлением(Строка);
	
	ЮТест.ОжидаетЧто(Результат).Равно(Эталон);
	
КонецПроцедуры

#КонецОбласти

#Область СтрокаНайтиИВыделитьОформлением

Процедура Тест_СтрокаНайтиИВыделитьОформлением(Строка, ИскомаяСтрока, Знач Эталон) Экспорт

	Перем ЮТест;
	ЮТест = ЖЧТ_Движок.ЮТест();

	ТестируемыйМодуль = ТестируемыйМодуль();
	
	Если ЗначениеЗаполнено(Эталон) Тогда
		Эталон = ТестируемыйМодуль.СтрокаВыделеннаяОформлением(Эталон);
	КонецЕсли;
	
	Результат = ТестируемыйМодуль.СтрокаНайтиИВыделитьОформлением(Строка, ИскомаяСтрока);
	
	ЮТест.ОжидаетЧто(Результат).Равно(Эталон);
	
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

	Возврат ЖЧТ_Модули.СтроковыеФункцииКлиентСервер();
	
КонецФункции

#КонецОбласти