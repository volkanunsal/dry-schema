RSpec.describe 'Predicates: Lt' do
  context 'with required' do
    subject(:schema) do
      Dry::Schema.form do
        required(:foo) { int? & lt?(23) }
      end
    end

    context 'with valid input' do
      let(:input) { { 'foo' => '1' } }

      it 'is successful' do
        expect(result).to be_successful
      end
    end

    context 'with missing input' do
      let(:input) { {} }

      it 'is not successful' do
        expect(result).to be_failing ['is missing', 'must be less than 23']
      end
    end

    context 'with nil input' do
      let(:input) { { 'foo' => nil } }

      it 'is not successful' do
        expect(result).to be_failing ['must be an integer', 'must be less than 23']
      end
    end

    context 'with blank input' do
      let(:input) { { 'foo' => '' } }

      it 'is not successful' do
        expect(result).to be_failing ['must be an integer', 'must be less than 23']
      end
    end

    context 'with invalid input type' do
      let(:input) { { 'foo' => [] } }

      it 'is not successful' do
        expect(result).to be_failing ['must be an integer', 'must be less than 23']
      end
    end

    context 'with equal input' do
      let(:input) { { 'foo' => '23' } }

      it 'is not successful' do
        expect(result).to be_failing ['must be less than 23']
      end
    end

    context 'with greater than input' do
      let(:input) { { 'foo' => '99' } }

      it 'is not successful' do
        expect(result).to be_failing ['must be less than 23']
      end
    end
  end

  context 'with optional' do
    subject(:schema) do
      Dry::Schema.form do
        optional(:foo) { int? & lt?(23) }
      end
    end

    context 'with valid input' do
      let(:input) { { 'foo' => '1' } }

      it 'is successful' do
        expect(result).to be_successful
      end
    end

    context 'with missing input' do
      let(:input) { {} }

      it 'is successful' do
        expect(result).to be_successful
      end
    end

    context 'with nil input' do
      let(:input) { { 'foo' => nil } }

      it 'is not successful' do
        expect(result).to be_failing ['must be an integer', 'must be less than 23']
      end
    end

    context 'with blank input' do
      let(:input) { { 'foo' => '' } }

      it 'is not successful' do
        expect(result).to be_failing ['must be an integer', 'must be less than 23']
      end
    end

    context 'with invalid input type' do
      let(:input) { { 'foo' => [] } }

      it 'is not successful' do
        expect(result).to be_failing ['must be an integer', 'must be less than 23']
      end
    end

    context 'with equal input' do
      let(:input) { { 'foo' => '23' } }

      it 'is not successful' do
        expect(result).to be_failing ['must be less than 23']
      end
    end

    context 'with greater than input' do
      let(:input) { { 'foo' => '99' } }

      it 'is not successful' do
        expect(result).to be_failing ['must be less than 23']
      end
    end
  end

  context 'as macro' do
    context 'with required' do
      context 'with value' do
        subject(:schema) do
          Dry::Schema.form do
            required(:foo).value(:int?, lt?: 23)
          end
        end

        context 'with valid input' do
          let(:input) { { 'foo' => '1' } }

          it 'is successful' do
            expect(result).to be_successful
          end
        end

        context 'with missing input' do
          let(:input) { {} }

          it 'is not successful' do
            expect(result).to be_failing ['is missing', 'must be less than 23']
          end
        end

        context 'with nil input' do
          let(:input) { { 'foo' => nil } }

          it 'is not successful' do
            expect(result).to be_failing ['must be an integer', 'must be less than 23']
          end
        end

        context 'with blank input' do
          let(:input) { { 'foo' => '' } }

          it 'is not successful' do
            expect(result).to be_failing ['must be an integer', 'must be less than 23']
          end
        end

        context 'with invalid input type' do
          let(:input) { { 'foo' => [] } }

          it 'is not successful' do
            expect(result).to be_failing ['must be an integer', 'must be less than 23']
          end
        end

        context 'with equal input' do
          let(:input) { { 'foo' => '23' } }

          it 'is not successful' do
            expect(result).to be_failing ['must be less than 23']
          end
        end

        context 'with greater than input' do
          let(:input) { { 'foo' => '99' } }

          it 'is not successful' do
            expect(result).to be_failing ['must be less than 23']
          end
        end
      end

      context 'with filled' do
        subject(:schema) do
          Dry::Schema.form do
            required(:foo).filled(:int?, lt?: 23)
          end
        end

        context 'with valid input' do
          let(:input) { { 'foo' => '1' } }

          it 'is successful' do
            expect(result).to be_successful
          end
        end

        context 'with missing input' do
          let(:input) { {} }

          it 'is not successful' do
            expect(result).to be_failing ['is missing', 'must be less than 23']
          end
        end

        context 'with nil input' do
          let(:input) { { 'foo' => nil } }

          it 'is not successful' do
            expect(result).to be_failing ['must be filled', 'must be less than 23']
          end
        end

        context 'with blank input' do
          let(:input) { { 'foo' => '' } }

          it 'is not successful' do
            expect(result).to be_failing ['must be filled', 'must be less than 23']
          end
        end

        context 'with invalid input type' do
          let(:input) { { 'foo' => [] } }

          it 'is not successful' do
            expect(result).to be_failing ['must be filled', 'must be less than 23']
          end
        end

        context 'with equal input' do
          let(:input) { { 'foo' => '23' } }

          it 'is not successful' do
            expect(result).to be_failing ['must be less than 23']
          end
        end

        context 'with greater than input' do
          let(:input) { { 'foo' => '99' } }

          it 'is not successful' do
            expect(result).to be_failing ['must be less than 23']
          end
        end
      end

      context 'with maybe' do
        subject(:schema) do
          Dry::Schema.form do
            required(:foo).maybe(:int?, lt?: 23)
          end
        end

        context 'with valid input' do
          let(:input) { { 'foo' => '1' } }

          it 'is successful' do
            expect(result).to be_successful
          end
        end

        context 'with missing input' do
          let(:input) { {} }

          it 'is not successful' do
            expect(result).to be_failing ['is missing', 'must be less than 23']
          end
        end

        context 'with nil input' do
          let(:input) { { 'foo' => nil } }

          it 'is successful' do
            expect(result).to be_successful
          end
        end

        context 'with blank input' do
          let(:input) { { 'foo' => '' } }

          it 'is successful' do
            expect(result).to be_successful
          end
        end

        context 'with invalid input type' do
          let(:input) { { 'foo' => [] } }

          it 'is not successful' do
            expect(result).to be_failing ['must be an integer', 'must be less than 23']
          end
        end

        context 'with equal input' do
          let(:input) { { 'foo' => '23' } }

          it 'is not successful' do
            expect(result).to be_failing ['must be less than 23']
          end
        end

        context 'with greater than input' do
          let(:input) { { 'foo' => '99' } }

          it 'is not successful' do
            expect(result).to be_failing ['must be less than 23']
          end
        end
      end
    end

    context 'with optional' do
      context 'with value' do
        subject(:schema) do
          Dry::Schema.form do
            optional(:foo).value(:int?, lt?: 23)
          end
        end

        context 'with valid input' do
          let(:input) { { 'foo' => '1' } }

          it 'is successful' do
            expect(result).to be_successful
          end
        end

        context 'with missing input' do
          let(:input) { {} }

          it 'is successful' do
            expect(result).to be_successful
          end
        end

        context 'with nil input' do
          let(:input) { { 'foo' => nil } }

          it 'is not successful' do
            expect(result).to be_failing ['must be an integer', 'must be less than 23']
          end
        end

        context 'with blank input' do
          let(:input) { { 'foo' => '' } }

          it 'is not successful' do
            expect(result).to be_failing ['must be an integer', 'must be less than 23']
          end
        end

        context 'with invalid input type' do
          let(:input) { { 'foo' => [] } }

          it 'is not successful' do
            expect(result).to be_failing ['must be an integer', 'must be less than 23']
          end
        end

        context 'with equal input' do
          let(:input) { { 'foo' => '23' } }

          it 'is not successful' do
            expect(result).to be_failing ['must be less than 23']
          end
        end

        context 'with greater than input' do
          let(:input) { { 'foo' => '99' } }

          it 'is not successful' do
            expect(result).to be_failing ['must be less than 23']
          end
        end
      end

      context 'with filled' do
        subject(:schema) do
          Dry::Schema.form do
            optional(:foo).filled(:int?, lt?: 23)
          end
        end

        context 'with valid input' do
          let(:input) { { 'foo' => '1' } }

          it 'is successful' do
            expect(result).to be_successful
          end
        end

        context 'with missing input' do
          let(:input) { {} }

          it 'is successful' do
            expect(result).to be_successful
          end
        end

        context 'with nil input' do
          let(:input) { { 'foo' => nil } }

          it 'is not successful' do
            expect(result).to be_failing ['must be filled', 'must be less than 23']
          end
        end

        context 'with blank input' do
          let(:input) { { 'foo' => '' } }

          it 'is not successful' do
            expect(result).to be_failing ['must be filled', 'must be less than 23']
          end
        end

        context 'with invalid input type' do
          let(:input) { { 'foo' => [] } }

          it 'is not successful' do
            expect(result).to be_failing ['must be filled', 'must be less than 23']
          end
        end

        context 'with equal input' do
          let(:input) { { 'foo' => '23' } }

          it 'is not successful' do
            expect(result).to be_failing ['must be less than 23']
          end
        end

        context 'with greater than input' do
          let(:input) { { 'foo' => '99' } }

          it 'is not successful' do
            expect(result).to be_failing ['must be less than 23']
          end
        end
      end

      context 'with maybe' do
        subject(:schema) do
          Dry::Schema.form do
            optional(:foo).maybe(:int?, lt?: 23)
          end
        end

        context 'with valid input' do
          let(:input) { { 'foo' => '1' } }

          it 'is successful' do
            expect(result).to be_successful
          end
        end

        context 'with missing input' do
          let(:input) { {} }

          it 'is successful' do
            expect(result).to be_successful
          end
        end

        context 'with nil input' do
          let(:input) { { 'foo' => nil } }

          it 'is successful' do
            expect(result).to be_successful
          end
        end

        context 'with blank input' do
          let(:input) { { 'foo' => '' } }

          it 'is successful' do
            expect(result).to be_successful
          end
        end

        context 'with invalid input type' do
          let(:input) { { 'foo' => [] } }

          it 'is not successful' do
            expect(result).to be_failing ["must be an integer", "must be less than 23"]
          end
        end

        context 'with equal input' do
          let(:input) { { 'foo' => '23' } }

          it 'is not successful' do
            expect(result).to be_failing ['must be less than 23']
          end
        end

        context 'with greater than input' do
          let(:input) { { 'foo' => '99' } }

          it 'is not successful' do
            expect(result).to be_failing ['must be less than 23']
          end
        end
      end
    end
  end
end
