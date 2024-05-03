class PessoasController < ApplicationController
  def index
    @pessoas =  Pessoa.all
  end

  def new
    @pessoa = Pessoa.new
  end

  def create
    @pessoa = Pessoa.create(pessoa_params)
    if @pessoa.save
      redirect_to @pessoa, notice: "Pessoa criada com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @pessoa = Pessoa.find_by(params[:id])
  end

  def update
    @pessoa = Pessoa.find(params[:id])
    if @pessoa.update(pessoa_params)
      redirect_to @pessoa, notice: "Entidade alterada com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @pessoa = Pessoa.find(params[:id])
  end

  def destroy
    pessoa = Pessoa.find(params[:id])
    pessoa.destroy
    redirect_to root_path, notice: "Entidade alterada com sucesso!"
  end

  def transferencia
    valor = params[:valor].to_f
    pessoa1 = Pessoa.find_by(id: params[:pessoa1_id])
    pessoa2 = Pessoa.find_by(cpf: params[:pessoa2_cpf])
    if pessoa1===pessoa2
      flash[:notice] = "Transação de tu pra tu concluída."
      redirect_to root_path
    else
      pessoa1.update(valor_da_carteira: pessoa1.valor_da_carteira - valor)
      puts(pessoa1.valor_da_carteira)
      pessoa2.update(valor_da_carteira: pessoa2.valor_da_carteira + valor)
      flash[:notice] = "Transação de tu pra tu concluída."
      redirect_to root_path
    end
  end

  private
  def pessoa_params
    params.require(:pessoa).permit(:nome, :cpf, :valor_da_carteira)
  end

end
