"""empty message

Revision ID: 161b9929dd83
Revises: 1f1c26694c0a
Create Date: 2020-01-10 20:15:07.054078

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '161b9929dd83'
down_revision = '1f1c26694c0a'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('awards',
    sa.Column('date_created', sa.DateTime(), nullable=False),
    sa.Column('last_updated', sa.DateTime(), nullable=False),
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('awardee', sa.String(), nullable=False),
    sa.Column('award', sa.String(), nullable=False),
    sa.Column('awarding_body', sa.String(), nullable=False),
    sa.Column('year', sa.Integer(), nullable=False),
    sa.PrimaryKeyConstraint('id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('awards')
    # ### end Alembic commands ###