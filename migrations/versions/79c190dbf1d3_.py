"""empty message

Revision ID: 79c190dbf1d3
Revises:
Create Date: 2020-01-06 03:37:21.083964

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '79c190dbf1d3'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    op.add_column('publications',
        sa.Column('remarks', sa.VARCHAR(), nullable=True)
    )
