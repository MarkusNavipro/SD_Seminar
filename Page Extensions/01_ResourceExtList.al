pageextension 50101 "CSD ResourceListExt" extends "Resource List"
{
    // CSD1.00 - 2018-10-08 - D. E. Veloper
    layout
    {
        modify(Type)
        {
            Visible = ShowType;
        }

        addafter(Type)
        {
            field("CSD Resource Type"; "CSD Resource Type")
            {

            }

            field("CSD Maximum Participants"; "CSD Maximum Participants")
            {
                Visible = ShowMaxField;
            }

        }

    }

    trigger OnOpenPage()
    begin
        FilterGroup(3);

        ShowType := (GetFilter(Type) = '');

        ShowMaxField := (GetFilter(Type) = format(Type::Machine));

        FilterGroup(0);

    end;

    var
        [InDataSet]
        ShowMaxField: Boolean;

        [InDataSet]
        ShowType: Boolean;

}