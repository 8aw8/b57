
{*****************************************}
{                                         }
{            XML Data Binding             }
{                                         }
{         Generated on: 30.11.2010 18:03:05 }
{       Generated from: C:\aaa.xsd        }
{   Settings stored in: C:\aaa.xdb        }
{                                         }
{*****************************************}

unit aaa;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLForm = interface;
  IXMLFormList = interface;
  IXMLFilm = interface;
  IXMLFilmList = interface;
  IXMLSeans = interface;

{ IXMLForm }

  IXMLForm = interface(IXMLNode)
    ['{90CF5F9F-98A5-4515-8E5B-24724B63B257}']
    { Property Accessors }
    function Get_Place_x: WideString;
    function Get_Place_y: WideString;
    function Get_Section: WideString;
    function Get_Price: Double;
    function Get_Discount: Double;
    function Get_Ticket_type: WideString;
    function Get_Sale_date: WideString;
    procedure Set_Place_x(Value: WideString);
    procedure Set_Place_y(Value: WideString);
    procedure Set_Section(Value: WideString);
    procedure Set_Price(Value: Double);
    procedure Set_Discount(Value: Double);
    procedure Set_Ticket_type(Value: WideString);
    procedure Set_Sale_date(Value: WideString);
    { Methods & Properties }
    property Place_x: WideString read Get_Place_x write Set_Place_x;
    property Place_y: WideString read Get_Place_y write Set_Place_y;
    property Section: WideString read Get_Section write Set_Section;
    property Price: Double read Get_Price write Set_Price;
    property Discount: Double read Get_Discount write Set_Discount;
    property Ticket_type: WideString read Get_Ticket_type write Set_Ticket_type;
    property Sale_date: WideString read Get_Sale_date write Set_Sale_date;
  end;

{ IXMLFormList }

  IXMLFormList = interface(IXMLNodeCollection)
    ['{42553DE4-826C-4BDA-BB41-BE714279658B}']
    { Methods & Properties }
    function Add: IXMLForm;
    function Insert(const Index: Integer): IXMLForm;
    function Get_Item(Index: Integer): IXMLForm;
    property Items[Index: Integer]: IXMLForm read Get_Item; default;
  end;

{ IXMLFilm }

  IXMLFilm = interface(IXMLNode)
    ['{7F4D9A7B-D95A-4B34-91CE-DFB769474D65}']
    { Property Accessors }
    function Get_Pu_number: WideString;
    procedure Set_Pu_number(Value: WideString);
    { Methods & Properties }
    property Pu_number: WideString read Get_Pu_number write Set_Pu_number;
  end;

{ IXMLFilmList }

  IXMLFilmList = interface(IXMLNodeCollection)
    ['{8612B94D-FEC5-421B-B1E6-1C14CD683F39}']
    { Methods & Properties }
    function Add: IXMLFilm;
    function Insert(const Index: Integer): IXMLFilm;
    function Get_Item(Index: Integer): IXMLFilm;
    property Items[Index: Integer]: IXMLFilm read Get_Item; default;
  end;

{ IXMLSeans }

  IXMLSeans = interface(IXMLNode)
    ['{78F5B9C8-A7F2-411F-ADBA-E36AC0388B7B}']
    { Property Accessors }
    function Get_Org_id: LongWord;
    function Get_Showroom: WideString;
    function Get_Seans_date: WideString;
    function Get_Seans_title: WideString;
    function Get_Film: IXMLFilmList;
    function Get_Form: IXMLFormList;
    procedure Set_Org_id(Value: LongWord);
    procedure Set_Showroom(Value: WideString);
    procedure Set_Seans_date(Value: WideString);
    procedure Set_Seans_title(Value: WideString);
    { Methods & Properties }
    property Org_id: LongWord read Get_Org_id write Set_Org_id;
    property Showroom: WideString read Get_Showroom write Set_Showroom;
    property Seans_date: WideString read Get_Seans_date write Set_Seans_date;
    property Seans_title: WideString read Get_Seans_title write Set_Seans_title;
    property Film: IXMLFilmList read Get_Film;
    property Form: IXMLFormList read Get_Form;
  end;

{ Forward Decls }

  TXMLForm = class;
  TXMLFormList = class;
  TXMLFilm = class;
  TXMLFilmList = class;
  TXMLSeans = class;

{ TXMLForm }

  TXMLForm = class(TXMLNode, IXMLForm)
  protected
    { IXMLForm }
    function Get_Place_x: WideString;
    function Get_Place_y: WideString;
    function Get_Section: WideString;
    function Get_Price: Double;
    function Get_Discount: Double;
    function Get_Ticket_type: WideString;
    function Get_Sale_date: WideString;
    procedure Set_Place_x(Value: WideString);
    procedure Set_Place_y(Value: WideString);
    procedure Set_Section(Value: WideString);
    procedure Set_Price(Value: Double);
    procedure Set_Discount(Value: Double);
    procedure Set_Ticket_type(Value: WideString);
    procedure Set_Sale_date(Value: WideString);
  end;

{ TXMLFormList }

  TXMLFormList = class(TXMLNodeCollection, IXMLFormList)
  protected
    { IXMLFormList }
    function Add: IXMLForm;
    function Insert(const Index: Integer): IXMLForm;
    function Get_Item(Index: Integer): IXMLForm;
  end;

{ TXMLFilm }

  TXMLFilm = class(TXMLNode, IXMLFilm)
  protected
    { IXMLFilm }
    function Get_Pu_number: WideString;
    procedure Set_Pu_number(Value: WideString);
  end;

{ TXMLFilmList }

  TXMLFilmList = class(TXMLNodeCollection, IXMLFilmList)
  protected
    { IXMLFilmList }
    function Add: IXMLFilm;
    function Insert(const Index: Integer): IXMLFilm;
    function Get_Item(Index: Integer): IXMLFilm;
  end;

{ TXMLSeans }

  TXMLSeans = class(TXMLNode, IXMLSeans)
  private
    FFilm: IXMLFilmList;
    FForm: IXMLFormList;
  protected
    { IXMLSeans }
    function Get_Org_id: LongWord;
    function Get_Showroom: WideString;
    function Get_Seans_date: WideString;
    function Get_Seans_title: WideString;
    function Get_Film: IXMLFilmList;
    function Get_Form: IXMLFormList;
    procedure Set_Org_id(Value: LongWord);
    procedure Set_Showroom(Value: WideString);
    procedure Set_Seans_date(Value: WideString);
    procedure Set_Seans_title(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

implementation

{ TXMLForm }

function TXMLForm.Get_Place_x: WideString;
begin
  Result := AttributeNodes['place_x'].Text;
end;

procedure TXMLForm.Set_Place_x(Value: WideString);
begin
  SetAttribute('place_x', Value);
end;

function TXMLForm.Get_Place_y: WideString;
begin
  Result := AttributeNodes['place_y'].Text;
end;

procedure TXMLForm.Set_Place_y(Value: WideString);
begin
  SetAttribute('place_y', Value);
end;

function TXMLForm.Get_Section: WideString;
begin
  Result := AttributeNodes['section'].Text;
end;

procedure TXMLForm.Set_Section(Value: WideString);
begin
  SetAttribute('section', Value);
end;

function TXMLForm.Get_Price: Double;
begin
  Result := AttributeNodes['price'].NodeValue;
end;

procedure TXMLForm.Set_Price(Value: Double);
begin
  SetAttribute('price', Value);
end;

function TXMLForm.Get_Discount: Double;
begin
  Result := AttributeNodes['discount'].NodeValue;
end;

procedure TXMLForm.Set_Discount(Value: Double);
begin
  SetAttribute('discount', Value);
end;

function TXMLForm.Get_Ticket_type: WideString;
begin
  Result := AttributeNodes['ticket_type'].Text;
end;

procedure TXMLForm.Set_Ticket_type(Value: WideString);
begin
  SetAttribute('ticket_type', Value);
end;

function TXMLForm.Get_Sale_date: WideString;
begin
  Result := AttributeNodes['sale_date'].Text;
end;

procedure TXMLForm.Set_Sale_date(Value: WideString);
begin
  SetAttribute('sale_date', Value);
end;

{ TXMLFormList }

function TXMLFormList.Add: IXMLForm;
begin
  Result := AddItem(-1) as IXMLForm;
end;

function TXMLFormList.Insert(const Index: Integer): IXMLForm;
begin
  Result := AddItem(Index) as IXMLForm;
end;
function TXMLFormList.Get_Item(Index: Integer): IXMLForm;
begin
  Result := List[Index] as IXMLForm;
end;

{ TXMLFilm }

function TXMLFilm.Get_Pu_number: WideString;
begin
  Result := AttributeNodes['pu_number'].Text;
end;

procedure TXMLFilm.Set_Pu_number(Value: WideString);
begin
  SetAttribute('pu_number', Value);
end;

{ TXMLFilmList }

function TXMLFilmList.Add: IXMLFilm;
begin
  Result := AddItem(-1) as IXMLFilm;
end;

function TXMLFilmList.Insert(const Index: Integer): IXMLFilm;
begin
  Result := AddItem(Index) as IXMLFilm;
end;
function TXMLFilmList.Get_Item(Index: Integer): IXMLFilm;
begin
  Result := List[Index] as IXMLFilm;
end;

{ TXMLSeans }

procedure TXMLSeans.AfterConstruction;
begin
  RegisterChildNode('film', TXMLFilm);
  RegisterChildNode('form', TXMLForm);
  FFilm := CreateCollection(TXMLFilmList, IXMLFilm, 'film') as IXMLFilmList;
  FForm := CreateCollection(TXMLFormList, IXMLForm, 'form') as IXMLFormList;
  inherited;
end;

function TXMLSeans.Get_Org_id: LongWord;
begin
  Result := AttributeNodes['org_id'].NodeValue;
end;

procedure TXMLSeans.Set_Org_id(Value: LongWord);
begin
  SetAttribute('org_id', Value);
end;

function TXMLSeans.Get_Showroom: WideString;
begin
  Result := AttributeNodes['showroom'].Text;
end;

procedure TXMLSeans.Set_Showroom(Value: WideString);
begin
  SetAttribute('showroom', Value);
end;

function TXMLSeans.Get_Seans_date: WideString;
begin
  Result := AttributeNodes['seans_date'].Text;
end;

procedure TXMLSeans.Set_Seans_date(Value: WideString);
begin
  SetAttribute('seans_date', Value);
end;

function TXMLSeans.Get_Seans_title: WideString;
begin
  Result := AttributeNodes['seans_title'].Text;
end;

procedure TXMLSeans.Set_Seans_title(Value: WideString);
begin
  SetAttribute('seans_title', Value);
end;

function TXMLSeans.Get_Film: IXMLFilmList;
begin
  Result := FFilm;
end;

function TXMLSeans.Get_Form: IXMLFormList;
begin
  Result := FForm;
end;

end. 