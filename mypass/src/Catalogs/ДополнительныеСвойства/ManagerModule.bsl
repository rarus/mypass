///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2022-2025, ООО 1С-Рарус
// Все права защищены. Эта программа и сопроводительные материалы предоставляются
// в соответствии с условиями лицензии Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by-sa/4.0/legalcode
//////////////////////////////////////////////////////////////////////////////////////////////////////

#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область СлужебныеПроцедурыИФункции

// Получить уникальные реквизиты.
// 
// Параметры:
//  Объект - СправочникОбъект.ВидыДанных
// 
// Возвращаемое значение:
//  Структура -  Получить уникальные реквизиты:
//
Функция ПолучитьУникальныеРеквизиты(Объект) Экспорт
	
	// Структура уникальных реквизитов
	УникальныеРеквизиты = Новый Структура;
	УникальныеРеквизиты.Вставить("Наименование");
	
	// Возвращаем сформированные параметры проверки
	Возврат УникальныеРеквизиты;
	
КонецФункции // ПолучитьУникальныеРеквизиты()

#КонецОбласти

#КонецЕсли

