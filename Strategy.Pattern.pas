unit Strategy.Pattern;

interface

type

  TContext = class;

  // IStrategyインターフェース: 戦略の共通インターフェースを定義
  IStrategy = interface
  ['{7F63C143-98D0-4B8C-A02B-894D145BB745}']
    // Moveメソッド: TContextを操作し、結果を返す
    function Move(c: TContext): integer;
  end;

  // TStrategy1クラス: IStrategyを実装し、カウンターをインクリメントする戦略
  TStrategy1 = class(TInterfacedObject, IStrategy)
  public
    function Move(c: TContext): integer;
  end;

  // TStrategy2クラス: IStrategyを実装し、カウンターをデクリメントする戦略
  TStrategy2 = class(TInterfacedObject, IStrategy)
  public
    function Move(c: TContext): integer;
  end;

  // TContextクラス: 戦略を保持し、実行するコンテキスト
  TContext = class
  private
    FStrategy: IStrategy; // 現在の戦略
  public
    FCounter: integer; // カウンターの値
    constructor Create; // 初期化
    function Algorithm: integer; // 現在の戦略を実行
    procedure SetStrategy(s: IStrategy); // 戦略を変更
  end;

implementation

{ TStrategy1 }

// Moveメソッド: カウンターをインクリメント
function TStrategy1.Move(c: TContext): integer;
begin
  c.FCounter := c.FCounter + 1;
  Result := c.FCounter;
end;

{ TStrategy2 }

// Moveメソッド: カウンターをデクリメント
function TStrategy2.Move(c: TContext): integer;
begin
  c.FCounter := c.FCounter - 1;
  Result := c.FCounter;
end;

{ TContext }

// Algorithmメソッド: 現在の戦略を実行
function TContext.Algorithm: integer;
begin
  Result := FStrategy.Move(Self);
end;

// コンストラクタ: 初期値を設定し、デフォルト戦略を設定
constructor TContext.Create;
begin
  inherited;
  FCounter := 5; // 初期カウンター値
  FStrategy := TStrategy1.Create; // デフォルト戦略
end;

// SetStrategyメソッド: 戦略を変更
procedure TContext.SetStrategy(s: IStrategy);
begin
  FStrategy := s;
end;

end.
