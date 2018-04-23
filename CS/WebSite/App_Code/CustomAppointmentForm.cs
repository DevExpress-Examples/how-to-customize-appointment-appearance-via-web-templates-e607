using System;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxScheduler;
using DevExpress.Web.ASPxScheduler.Internal;
using DevExpress.XtraScheduler;
using DevExpress.Web.ASPxScheduler.Controls;

public class CustomFieldNames {
	public const string Price = "Price";	
}

public class MyAppointmentFormTemplateContainer : AppointmentFormTemplateContainer {
	public MyAppointmentFormTemplateContainer(ASPxScheduler control)
		: base(control) {
	}
	#region Properties	
	public double Price {
		get {
			object val = Appointment.CustomFields[CustomFieldNames.Price];
			return (val == DBNull.Value) ? 0 : Convert.ToDouble(val);
		}
	}
	#endregion
}
public class MyAppointmentSaveCallbackCommand : AppointmentFormSaveCallbackCommand {
	public MyAppointmentSaveCallbackCommand(ASPxScheduler control)
		: base(control) {
	}
	protected internal new MyAppointmentFormController Controller { get { return (MyAppointmentFormController)base.Controller; } }

	protected override void AssignControllerValues() {
		ASPxTextBox tbSubject = (ASPxTextBox)FindControlByID("tbSubject");
		ASPxTextBox tbLocation = (ASPxTextBox)FindControlByID("tbLocation");
		ASPxTextBox tbPrice = (ASPxTextBox)FindControlByID("tbPrice");
		ASPxDateEdit edtStartDate = (ASPxDateEdit)FindControlByID("edtStartDate");
		ASPxDateEdit edtEndDate = (ASPxDateEdit)FindControlByID("edtEndDate");
		ASPxMemo memDescription = (ASPxMemo)FindControlByID("memDescription");		

		Controller.Subject = tbSubject.Text;
		Controller.Location = tbLocation.Text;
		Controller.Description = memDescription.Text;

		Controller.Start = edtStartDate.Date;
		Controller.End = edtEndDate.Date;
		// custom fields 		
		Controller.Price = Convert.ToDouble(tbPrice.Text);

		DateTime clientStart = FromClientTime(Controller.Start);
		AssignControllerRecurrenceValues(clientStart);
	}
	protected override AppointmentFormController CreateAppointmentFormController(Appointment apt) {
		return new MyAppointmentFormController(Control, apt);
	}
}

public class MyAppointmentFormController : AppointmentFormController {	
	private const string PriceFieldName = "Price";

	public MyAppointmentFormController(ASPxScheduler control, Appointment apt)
		: base(control, apt) {
	}	
	public double Price { get { return (double)EditedAppointmentCopy.CustomFields[PriceFieldName]; } set { EditedAppointmentCopy.CustomFields[PriceFieldName] = value; } }	
	double SourcePrice { get { return (double)SourceAppointment.CustomFields[PriceFieldName]; } set { SourceAppointment.CustomFields[PriceFieldName] = value; } }

	public override bool IsAppointmentChanged() {
		if (base.IsAppointmentChanged())
			return true;
		return SourcePrice != Price;
	}
	protected override void ApplyCustomFieldsValues() {		
		SourcePrice = Price;
	}
}
