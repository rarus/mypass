///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2022-2025, ООО 1С-Рарус
// Все права защищены. Эта программа и сопроводительные материалы предоставляются
// в соответствии с условиями лицензии Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by-sa/4.0/legalcode
//////////////////////////////////////////////////////////////////////////////////////////////////////

#Область ОбработчикиСобытийФормы

// Обработчик события возникающего на сервере при создании формы.
//
// Параметры:
//  Отказ                - Булево - Признак отказа от создания формы.
//  СтандартнаяОбработка - Булево - В данный параметр передается признак выполнения системной обработки события.
//
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ЗаполнитьЗначенияСвойств(Объект, Параметры);
	ЗаполнитьСпискиВыбораОтборов();
	
	УстановитьОтборыСтрок();
	
	Элементы.ГруппаОтборКлассификаторПодменю.Видимость = ПолучитьФункциональнуюОпцию("ИспользоватьКлассыДанных");
	Элементы.ГруппаОтборГруппаДанныхПодменю .Видимость = ПолучитьФункциональнуюОпцию("ИспользоватьГруппыДанных");
	
КонецПроцедуры

&НаСервере
Процедура ПриЗагрузкеДанныхИзНастроекНаСервере(Настройки)
	
	МоиПаролиСервер.ПриЗагрузкеДанныхИзНастроекНаСервере_Альтернативная(ЭтотОбъект, Настройки);
	
	СкрытьНедоступныеКнопки(1);
	СкрытьНедоступныеКнопки(2);
	
	// Свойства
	ТекущийОтборСвойства = ОтборСвойстваПоУмолчанию;
	Если ТекущийОтборСвойства.Количество() Тогда
		ПриЗагрузкеДанныхИзНастроекНаСервере_Альтернативная_Свойства();
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

//@skip-check module-structure-form-event-regions
#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура СоответствиеКомандИспользованиеКлассификаторПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.СоответствиеКомандОтборКлассификаторМеню.ТекущиеДанные; // СтрокаТаблицыЗначений
	Если ТекущиеДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	МоиПаролиКлиент.КлассификаторВыборНаКлиенте(ЭтотОбъект, ТекущиеДанные);
	
	СкрытьНедоступныеКнопки(1);
	
КонецПроцедуры

&НаКлиенте
Процедура СоответствиеКомандИспользованиеГруппаДанныхПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.СоответствиеКомандОтборГруппаДанныхМеню.ТекущиеДанные; // СтрокаТаблицыЗначений
	Если ТекущиеДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	МоиПаролиКлиент.ГруппаДанныхВыборНаКлиенте(ЭтотОбъект, ТекущиеДанные);
	
	СкрытьНедоступныеКнопки(3);
	
КонецПроцедуры

&НаКлиенте
Процедура СоответствиеКомандИспользованиеВидДанныхПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.СоответствиеКомандОтборВидДанныхМеню.ТекущиеДанные; // СтрокаТаблицыЗначений
	Если ТекущиеДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	МоиПаролиКлиент.ВидДанныхВыборНаКлиенте(ЭтотОбъект, ТекущиеДанные);
	
	СкрытьНедоступныеКнопки(2);
	
КонецПроцедуры

&НаКлиенте
Процедура СоответствиеКомандИспользованиеАктуальностьПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.СоответствиеКомандОтборАктуальностьМеню.ТекущиеДанные; // СтрокаТаблицыЗначений
	Если ТекущиеДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	МоиПаролиКлиент.СтатусДанныхВыборНаКлиенте(ЭтотОбъект, ТекущиеДанные);
	
	СкрытьНедоступныеКнопки(4);
	
КонецПроцедуры

&НаКлиенте
Процедура СоответствиеКомандИспользованиеСвойстваПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.СоответствиеКомандОтборСвойстваМеню.ТекущиеДанные; // СтрокаТаблицыЗначений
	Если ТекущиеДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	МоиПаролиКлиент.СвойствоВыборНаКлиенте(ЭтотОбъект, ТекущиеДанные);
	
	СкрытьНедоступныеКнопки(5);
	
КонецПроцедуры

&НаКлиенте
Процедура ДекорацияСкачатьНажатие(Элемент)
	
	СкачатьВыбранныеДанные();
	
КонецПроцедуры

//@skip-check invocation-parameter-type-intersect
&НаКлиенте
Процедура ПоследнийСохраненныйФайлОткрытие(Элемент, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	
	Если ЗначениеЗаполнено(ПоследнийСкачанныйФайл) Тогда
		
		ОписаниеОповещения = Новый ОписаниеОповещения("Подключаемый_ОбработкаРезультатаОповещения", ЭтотОбъект, "ЗапускПриложения");
		НачатьЗапускПриложения(ОписаниеОповещения, ПоследнийСкачанныйФайл);
		
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

// Обработчик события нажатия кнопки "Скачать".
//
// Параметры:
//  Команда - КомандаФормы - Команда, в которой возникло данное событие.
//
&НаКлиенте
Процедура Скачать(Команда)
	
	СкачатьВыбранныеДанные();
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

#Область ОбработчикиСлужебногоПрограммногоИнтерфейса

// Подключаемый обработка результата оповещения.
// 
// Параметры:
//  РезультатОповещения - Массив Из Строка - Результат оповещения
//  ДополнительныеПараметры - Неопределено -  Дополнительные параметры
//@skip-check invocation-parameter-type-intersect
&НаКлиенте
Процедура Подключаемый_ОбработкаРезультатаОповещения(РезультатОповещения, ДополнительныеПараметры = Неопределено) Экспорт
	
	Если ДополнительныеПараметры = "ДиалогСкачиванияФайла" Тогда
		
		Если ЗначениеЗаполнено(РезультатОповещения) И РезультатОповещения.Количество() Тогда
			
			ПутьКФайлу = РезультатОповещения[0]; // Строка
			
			Попытка
				
				СформироватьФайлСДанными(ПутьКФайлу);
				
				ПоследнийСкачанныйФайл = ПутьКФайлу;
				
				ОписаниеОповещения = Новый ОписаниеОповещения("Подключаемый_ОбработкаРезультатаОповещения", ЭтотОбъект, "ЗапускПриложения");
				НачатьЗапускПриложения(ОписаниеОповещения, ПоследнийСкачанныйФайл);
				
				ПоказатьОповещениеПользователя(
					НСтр("ru = 'Скачивание данных'"), ,
					НСтр("ru = 'Успешно выполнено'"),
					БиблиотекаКартинок.МоиПаролиУспешно64);
				
				// Закроем форму
				Закрыть();
				
			Исключение
				
				//@skip-check object-deprecated
				ОписаниеОшибки = КраткоеПредставлениеОшибки(ИнформацияОбОшибке());
				
				ПоказатьОповещениеПользователя(
					НСтр("ru = 'Скачивание данных'"), ,
					НСтр("ru = 'Не выполнено по причине:'") + Символы.НПП + ОписаниеОшибки,
					БиблиотекаКартинок.МоиПаролиНеуспешно64);
				
			КонецПопытки;
			
		Иначе
			
			#Если ВебКлиент Тогда
				
				ТекстФайла = СформироватьТекстСтроки();
				
				ТекстовыйДокумент = Новый ТекстовыйДокумент;
				ТекстовыйДокумент.УстановитьТекст(ТекстФайла);
				ТекстовыйДокумент.Показать("Список доступов и паролей");
				
				ПоказатьОповещениеПользователя(
					НСтр("ru = 'Скачивание данных'"), ,
					НСтр("ru = 'Успешно выполнено'"),
					БиблиотекаКартинок.МоиПаролиУспешно64);
				
				// Закроем форму
				Закрыть();
				
				Возврат;
				
			#КонецЕсли
			
			ПоказатьОповещениеПользователя(
				НСтр("ru = 'Скачивание данных'"), ,
				НСтр("ru = 'Выполнение отменено'"),
				БиблиотекаКартинок.МоиПаролиНеуспешно64);
			
		КонецЕсли;
		
	ИначеЕсли ДополнительныеПараметры = "ЗапускПриложения" Тогда
		
		// Зарезервировано
		
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункцииКлиент

#Область Скачивание

//@skip-check invocation-parameter-type-intersect
&НаКлиенте
Процедура СкачатьВыбранныеДанные()
	
	#Если ВебКлиент Тогда
		
		Подключаемый_ОбработкаРезультатаОповещения(, "ДиалогСкачиванияФайла");
		
		Возврат;
		
	#КонецЕсли
	
	ОтборКлассДанныхПоУмолчанию = ТекущийОтборКлассДанных;
	ОтборСтатусДанныхПоУмолчанию  = ТекущийОтборСтатусДанных;
	ОтборГруппаДанныхПоУмолчанию  = ТекущийОтборГруппаДанных;
	ОтборВидДанныхПоУмолчанию     = ТекущийОтборВидДанных;
	ОтборСвойстваПоУмолчанию      = ТекущийОтборСвойства;
	
	// Сохраним данные
	ДиалогСохранения = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Сохранение);
	ДиалогСохранения.ПолноеИмяФайла = ПоследнийСкачанныйФайл;
	ДиалогСохранения.Фильтр = "Текстовый файл (*.txt)|*.txt";
	ДиалогСохранения.МножественныйВыбор = Ложь;
	ДиалогСохранения.Заголовок = НСтр("ru = 'Выберите файл для скачивания'");
	
	// Описание оповещения
	ОписаниеОповещения = Новый ОписаниеОповещения("Подключаемый_ОбработкаРезультатаОповещения", ЭтотОбъект, "ДиалогСкачиванияФайла");
	
	ДиалогСохранения.Показать(ОписаниеОповещения);
	
КонецПроцедуры

&НаСервере
Процедура СформироватьФайлСДанными(Знач ПутьКФайлу)
	
	ТекстФайла = Новый ЗаписьТекста(ПутьКФайлу, КодировкаТекста.UTF8, Символы.ПС, Ложь);
	
	РезультатЗапроса = ПакетыЗапросаДляФормированияДанныхФормы();
	ЗаполнитьФайлДанными(РезультатЗапроса, ТекстФайла);
	
	ТекстФайла.Закрыть();
	
	МоиПаролиСервер.РегистрацияСобытия("Экспорт");
	
КонецПроцедуры

&НаСервере
Функция ПакетыЗапросаДляФормированияДанныхФормы()
	
	МассивОтборов = Новый Массив; // Массив из Строка
	Если ТекущийОтборВидДанных.Количество() Тогда
		МассивОтборов.Добавить("ВидДанных В (&ВидДанных)");
	КонецЕсли;
	Если ТекущийОтборКлассДанных.Количество() Тогда
		МассивОтборов.Добавить("КлассДанных В (&КлассДанных)");
	КонецЕсли;
	Если ТекущийОтборГруппаДанных.Количество() Тогда
		МассивОтборов.Добавить("ГруппаДанных В (&ГруппаДанных)");
	КонецЕсли;
	Если ТекущийОтборСтатусДанных.Количество() Тогда
		МассивОтборов.Добавить("СтатусДанных В (&СтатусДанных)");
	КонецЕсли;
	Если ТекущийОтборСвойства.Количество() Тогда
		МассивОтборов.Добавить("МоиПароли.Свойство В (&Свойства)");
	КонецЕсли;
	Если НЕ МассивОтборов.Количество() Тогда
		МассивОтборов.Добавить("Истина");
	КонецЕсли;
	СтрокаОтбора = СтрСоединить(МассивОтборов, " И ");
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ РАЗРЕШЕННЫЕ
		|	ВидыДанныхСвойстваВидаДанных.Свойство КАК Свойство,
		|	МАКСИМУМ(ВидыДанныхСвойстваВидаДанных.НомерСтроки) КАК НомерСтроки
		|ПОМЕСТИТЬ втПорядокСвойств
		|ИЗ
		|	Справочник.ВидыДанных.СвойстваВидаДанных КАК ВидыДанныхСвойстваВидаДанных
		|ГДЕ
		|	НЕ ВидыДанныхСвойстваВидаДанных.Ссылка.ПометкаУдаления
		|
		|СГРУППИРОВАТЬ ПО
		|	ВидыДанныхСвойстваВидаДанных.Свойство
		|;
		|
		|////////////////////////////////////////////////////////////////////////////////
		|ВЫБРАТЬ РАЗРЕШЕННЫЕ
		|	МоиПароли.КлассДанных КАК КлассДанных,
		|	МоиПароли.ГруппаДанных.Представление КАК ГруппаДанных,
		|	МоиПароли.ВидДанных.Представление КАК ВидДанных,
		|	МоиПароли.Свойство.Представление КАК Свойство,
		|	МоиПароли.Значение КАК Значение,
		|	МоиПароли.СтатусДанных КАК СтатусДанных,
		|	МоиПароли.Комментарий КАК Комментарий,
		|	МоиПароли.ДатаИзменения КАК ДатаИзменения,
		|	ЕСТЬNULL(ПорядокСвойств.НомерСтроки, 0) КАК Порядок,
		|	МоиПароли.Регистратор КАК Регистратор,
		|	МоиПароли.ВидДанных КАК ВидДанныхСсылка
		|ИЗ
		|	РегистрСведений.МоиПароли КАК МоиПароли
		|		ЛЕВОЕ СОЕДИНЕНИЕ втПорядокСвойств КАК ПорядокСвойств
		|		ПО МоиПароли.Свойство = ПорядокСвойств.Свойство
		|ГДЕ
		|	&Отбор
		|
		|УПОРЯДОЧИТЬ ПО
		|	КлассДанных,
		|	ГруппаДанных,
		|	ВидДанных,
		|	Регистратор,
		|	Порядок
		|ИТОГИ
		|	МАКСИМУМ(СтатусДанных),
		|	МАКСИМУМ(Комментарий),
		|	МАКСИМУМ(ДатаИзменения),
		|	МАКСИМУМ(ВидДанныхСсылка)
		|ПО
		|	КлассДанных,
		|	ГруппаДанных,
		|	ВидДанных,
		|	Регистратор";
	Запрос.Текст = СтрЗаменить(Запрос.Текст, "&Отбор", СтрокаОтбора);
	Запрос.УстановитьПараметр("ВидДанных",     ТекущийОтборВидДанных);
	Запрос.УстановитьПараметр("КлассДанных", ТекущийОтборКлассДанных);
	Запрос.УстановитьПараметр("ГруппаДанных",  ТекущийОтборГруппаДанных);
	Запрос.УстановитьПараметр("СтатусДанных",  ТекущийОтборСтатусДанных);
	Запрос.УстановитьПараметр("Свойства",      ТекущийОтборСвойства);
	
	Возврат Запрос.Выполнить();
	
КонецФункции

//@skip-check invocation-parameter-type-intersect
//@skip-check property-return-type
&НаСервере
Процедура ЗаполнитьФайлДанными(РезультатЗапроса, ТекстФайла, ДополнительныеПараметры = Неопределено)
	
	Если РезультатЗапроса.Пустой() Тогда
		ВызватьИсключение(НСтр("ru = 'Не найдено данных для скачивания'"));
	КонецЕсли;
	
	ВыборкаКлассификатор = РезультатЗапроса.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкам);
	
	Пока ВыборкаКлассификатор.Следующий() Цикл
		
		ТекстФайла.ЗаписатьСтроку("---------------------------------------------------------------------------------");
		ТекстФайла.ЗаписатьСтроку(ВыборкаКлассификатор.КлассДанных);
		
		ВыборкаГруппаДанных = ВыборкаКлассификатор.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкам);
		
		Пока ВыборкаГруппаДанных.Следующий() Цикл
			
			ТекстФайла.ЗаписатьСтроку("---------------------------------------------------------------------------------");
			ТекстФайла.ЗаписатьСтроку(Символы.Таб + ВыборкаГруппаДанных.ГруппаДанных);
			
			ВыборкаВидДанных = ВыборкаГруппаДанных.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкам);
			
			Пока ВыборкаВидДанных.Следующий() Цикл
				
				ТекстФайла.ЗаписатьСтроку("---------------------------------------------------------------------------------");
				ТекстФайла.ЗаписатьСтроку(Символы.Таб + Символы.Таб + ВыборкаВидДанных.ВидДанных);
				
				Выборка = ВыборкаВидДанных.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкам);
				
				Пока Выборка.Следующий() Цикл
					
					ТекстФайла.ЗаписатьСтроку("---------------------------------------------------------------------------------");
					
					СтрокаДанных = СтрШаблон("%1%1%1[%2] %3: %4", Символы.Таб, Выборка.СтатусДанных, Выборка.ДатаИзменения, Выборка.Комментарий);
					ТекстФайла.ЗаписатьСтроку(СтрокаДанных);
					
					ВыборкаСвойство = Выборка.Выбрать();
					
					Пока ВыборкаСвойство.Следующий() Цикл
						
						СтрокаДанных = СтрШаблон("%1%1%1%1%2: %3", Символы.Таб, ВыборкаСвойство.Свойство, ВыборкаСвойство.Значение);
						ТекстФайла.ЗаписатьСтроку(СтрокаДанных);
						
					КонецЦикла;
					
					// ЖурналСобытий
					ЗаписатьСобытие(
						ПредопределенноеЗначение("Перечисление.ТипыСобытия.Скачивание"),
						Выборка.Регистратор,
						Выборка.ВидДанныхСсылка);
					// Конец ЖурналСобытий
					
				КонецЦикла;
				
			КонецЦикла;
			
		КонецЦикла;
		
	КонецЦикла;
	
КонецПроцедуры

//@skip-check invocation-parameter-type-intersect
//@skip-check property-return-type
&НаСервере
Функция СформироватьТекстСтроки(ДополнительныеПараметры = Неопределено)
	
	МассивСтрок = Новый Массив;
	
	РезультатЗапроса = ПакетыЗапросаДляФормированияДанныхФормы();
	
	Если РезультатЗапроса.Пустой() Тогда
		ВызватьИсключение(НСтр("ru = 'Не найдено данных для скачивания'"));
	КонецЕсли;
	
	ВыборкаКлассификатор = РезультатЗапроса.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкам);
	
	Пока ВыборкаКлассификатор.Следующий() Цикл
		
		МассивСтрок.Добавить("---------------------------------------------------------------------------------");
		МассивСтрок.Добавить(ВыборкаКлассификатор.КлассДанных);
		
		ВыборкаГруппаДанных = ВыборкаКлассификатор.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкам);
		
		Пока ВыборкаГруппаДанных.Следующий() Цикл
			
			МассивСтрок.Добавить("---------------------------------------------------------------------------------");
			МассивСтрок.Добавить(Символы.Таб + ВыборкаГруппаДанных.ГруппаДанных);
			
			ВыборкаВидДанных = ВыборкаГруппаДанных.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкам);
			
			Пока ВыборкаВидДанных.Следующий() Цикл
				
				МассивСтрок.Добавить("---------------------------------------------------------------------------------");
				МассивСтрок.Добавить(Символы.Таб + Символы.Таб + ВыборкаВидДанных.ВидДанных);
				
				Выборка = ВыборкаВидДанных.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкам);
				
				Пока Выборка.Следующий() Цикл
					
					МассивСтрок.Добавить("---------------------------------------------------------------------------------");
					
					СтрокаДанных = СтрШаблон("%1%1%1[%2] %3: %4", Символы.Таб, Выборка.СтатусДанных, Выборка.ДатаИзменения, Выборка.Комментарий);
					МассивСтрок.Добавить(СтрокаДанных);
					
					ВыборкаСвойство = Выборка.Выбрать();
					
					Пока ВыборкаСвойство.Следующий() Цикл
						
						СтрокаДанных = СтрШаблон("%1%1%1%1%2: %3", Символы.Таб, ВыборкаСвойство.Свойство, ВыборкаСвойство.Значение);
						МассивСтрок.Добавить(СтрокаДанных);
						
					КонецЦикла;
					
					// ЖурналСобытий
					ЗаписатьСобытие(
						ПредопределенноеЗначение("Перечисление.ТипыСобытия.Скачивание"),
						Выборка.Регистратор,
						Выборка.ВидДанныхСсылка);
					// Конец ЖурналСобытий
					
				КонецЦикла;
				
			КонецЦикла;
			
		КонецЦикла;
		
	КонецЦикла;
	
	ТекстСтроки = СтрСоединить(МассивСтрок, Символы.ПС);
	
	Возврат ТекстСтроки;
	
КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункцииСервер

&НаСервере
Процедура ЗаполнитьСпискиВыбораОтборов()
	
	МоиПаролиСервер.ЗаполнитьСоответствиеКлассификацииДанных(ЭтотОбъект);
	МоиПаролиСервер.ЗаполнитьСоответствияКомандОтбора_Альтернативная(ЭтотОбъект);
	
	ЗаполнитьСоответствияКомандОтбора_Свойства();
	
КонецПроцедуры

&НаСервере
Процедура СкрытьНедоступныеКнопки(Знач НомерГруппы)
	
	МоиПаролиСервер.СкрытьНедоступныеКомандыОтбора_Альтернативная(ЭтотОбъект, НомерГруппы);
	
КонецПроцедуры

//@skip-check property-return-type
&НаСервере
Процедура УстановитьОтборыСтрок()
	
	ФиксированнаяСтруктураОтбора = Новый ФиксированнаяСтруктура("Доступность, НомерГруппы", Истина, 1);
	Элементы.СоответствиеКомандОтборКлассификаторМеню.ОтборСтрок = ФиксированнаяСтруктураОтбора;
	
	ФиксированнаяСтруктураОтбора = Новый ФиксированнаяСтруктура("Доступность, НомерГруппы", Истина, 2);
	Элементы.СоответствиеКомандОтборГруппаДанныхМеню.ОтборСтрок = ФиксированнаяСтруктураОтбора;
	
	ФиксированнаяСтруктураОтбора = Новый ФиксированнаяСтруктура("Доступность, НомерГруппы", Истина, 3);
	Элементы.СоответствиеКомандОтборВидДанныхМеню.ОтборСтрок = ФиксированнаяСтруктураОтбора;
	
	ФиксированнаяСтруктураОтбора = Новый ФиксированнаяСтруктура("Доступность, НомерГруппы", Истина, 4);
	Элементы.СоответствиеКомандОтборАктуальностьМеню.ОтборСтрок = ФиксированнаяСтруктураОтбора;
	
	ФиксированнаяСтруктураОтбора = Новый ФиксированнаяСтруктура("Доступность, НомерГруппы", Истина, 5);
	Элементы.СоответствиеКомандОтборСвойстваМеню.ОтборСтрок = ФиксированнаяСтруктураОтбора;
	
КонецПроцедуры

// Процедура заполнения формы рабочего места "Мои доступы и пароли".
//
// Параметры:
//  Форма					 - ФормаКлиентскогоПриложения - Форма.
//  ИспользованиеДляНовых	 - Булево - Признак по умолчанию для установки использования отбора.
//  ДополнительныеПараметры	 - Произвольный, Структура - Дополнительные параметры выполнения операции.
//
//@skip-check property-return-type
//@skip-check statement-type-change
&НаСервере
Процедура ЗаполнитьСоответствияКомандОтбора_Свойства(ДополнительныеПараметры = Неопределено)
	
	// Подменю свойства
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ РАЗРЕШЕННЫЕ
		|	СвойстваВидовДанных.Ссылка КАК Ссылка
		|ИЗ
		|	ПланВидовХарактеристик.СвойстваВидовДанных КАК СвойстваВидовДанных
		|ГДЕ
		|	НЕ СвойстваВидовДанных.ПометкаУдаления";
	Выборка = Запрос.Выполнить().Выбрать();
	Итератор = 1;
	Пока Выборка.Следующий() Цикл
		СтруктураПоиска = Новый Структура;
		СтруктураПоиска.Вставить("КомандаДанные", Выборка.Ссылка);
		СтруктураПоиска.Вставить("НомерГруппы", 5);
		Если НЕ СоответствиеКоманд.НайтиСтроки(СтруктураПоиска).Количество() Тогда
			// Соответствие команды и данных
			НовоеСоответствие = СоответствиеКоманд.Добавить();
			НовоеСоответствие.КомандаИмя = "Свойство" + Итератор;
			НовоеСоответствие.КомандаДанные = Выборка.Ссылка;
			НовоеСоответствие.ЗаголовокКоманды = Строка(Выборка.Ссылка);
			НовоеСоответствие.НомерГруппы = 5;
			НовоеСоответствие.Использование = Истина;
			НовоеСоответствие.Доступность   = Истина;
		КонецЕсли;
		Итератор = Итератор + 1;
	КонецЦикла;
	// Вариант "Все"
	СтруктураПоиска = Новый Структура;
	СтруктураПоиска.Вставить("КомандаДанные", ПланыВидовХарактеристик.СвойстваВидовДанных.ПустаяСсылка());
	СтруктураПоиска.Вставить("НомерГруппы", 5);
	Если НЕ СоответствиеКоманд.НайтиСтроки(СтруктураПоиска).Количество() Тогда
		НовоеСоответствие = СоответствиеКоманд.Вставить(0);
		НовоеСоответствие.КомандаИмя = "СвойствоВыбор_Все";
		НовоеСоответствие.КомандаДанные = ПланыВидовХарактеристик.СвойстваВидовДанных.ПустаяСсылка();
		НовоеСоответствие.ЗаголовокКоманды = НСтр("ru = 'Все'");
		НовоеСоответствие.Использование = Истина;
		НовоеСоответствие.Доступность   = Истина;
		НовоеСоответствие.НомерГруппы = 5;
	КонецЕсли;
	
КонецПроцедуры

&НаСервере
Процедура ПриЗагрузкеДанныхИзНастроекНаСервере_Альтернативная_Свойства(ДополнительныеПараметры = Неопределено)
	
	СтруктураПоиска = Новый Структура;
	СтруктураПоиска.Вставить("НомерГруппы", 5);
	
	НайденныеКомандыИспользование = СоответствиеКоманд.НайтиСтроки(СтруктураПоиска);
	Для Каждого ТекущийОтборСвойстваДанных Из НайденныеКомандыИспользование Цикл
		Если ЗначениеЗаполнено(ТекущийОтборСвойстваДанных.КомандаДанные) Тогда
			ТекущийОтборСвойстваДанных.Использование = НЕ (ТекущийОтборСвойства.НайтиПоЗначению(ТекущийОтборСвойстваДанных.КомандаДанные) = Неопределено);
		Иначе
			ТекущийОтборСвойстваДанных.Использование = Ложь;
		КонецЕсли;
	КонецЦикла;
	
	СтруктураНомерГруппы = Новый Структура;
	СтруктураНомерГруппы.Вставить("НомерГруппы", 5);
	СтруктураНомерГруппы.Вставить("Доступность", Истина);
	СоответствиеКомандВременная = СоответствиеКоманд.НайтиСтроки(СтруктураНомерГруппы);
	
	СтруктураПоиска = Новый Структура;
	СтруктураПоиска.Вставить("НомерГруппы", 5);
	СтруктураПоиска.Вставить("Использование", Истина);
	НайденныеКомандыИспользование = СоответствиеКоманд.НайтиСтроки(СтруктураПоиска);
	
	Если НайденныеКомандыИспользование.Количество() = СоответствиеКомандВременная.Количество() Тогда
		Элементы.ГруппаОтборСвойстваПодменю.Заголовок = НСтр("ru = 'Свойства: Все'");
	Иначе
		Элементы.ГруппаОтборСвойстваПодменю.Заголовок = НСтр("ru = 'Свойства:'") + Символы.НПП + НайденныеКомандыИспользование.Количество();
	КонецЕсли;
	
	Если (СоответствиеКомандВременная.Количество() - НайденныеКомандыИспользование.Количество()) = 1 Тогда
		
		СтруктураНомерГруппыИспользование = Новый Структура;
		СтруктураНомерГруппыИспользование.Вставить("НомерГруппы", 5);
		СтруктураНомерГруппыИспользование.Вставить("КомандаДанные", ПланыВидовХарактеристик.СвойстваВидовДанных.ПустаяСсылка());
		
		СоответствиеКомандВременнаяИспользование = СоответствиеКоманд.НайтиСтроки(СтруктураНомерГруппыИспользование);
		Если СоответствиеКомандВременнаяИспользование.Количество() Тогда
			СоответствиеКомандВременнаяИспользование[0].Использование = Истина;
			Элементы.ГруппаОтборСвойстваПодменю.Заголовок = НСтр("ru = 'Свойства: Все'");
		КонецЕсли;
		
	КонецЕсли;
	
КонецПроцедуры

#Область ЗаписатьСобытие

// Записать событие.
// 
// Параметры:
//  ТипСобытия - ПеречислениеСсылка.ТипСобытия - Тип события
//  Доступ - ДокументСсылка.ЭкземплярДоступа - Доступ
//  ВидДанных - СправочникСсылка.ВидыДанных - Вид данных
// Вид данных
//  Свойство - Неопределено - Свойство
// @skip-check property-return-type
&НаСервереБезКонтекста
Процедура ЗаписатьСобытие(Знач ТипСобытия, Знач Доступ, Знач ВидДанных, Знач Свойство = Неопределено)
	
	// ЖурналСобытий
	СтруктураСобытия = РегистрыСведений.ЖурналСобытий.СтруктураСобытия();
	СтруктураСобытия.ТипСобытия = ТипСобытия;
	СтруктураСобытия.ЭкземплярДоступа = Доступ;
	СтруктураСобытия.ВидДанных = ВидДанных;
	СтруктураСобытия.Свойство = Свойство;
	РегистрыСведений.ЖурналСобытий.ЗаписатьСобытие(СтруктураСобытия);
	// Конец ЖурналСобытий
	
КонецПроцедуры

#КонецОбласти

#КонецОбласти

#КонецОбласти
